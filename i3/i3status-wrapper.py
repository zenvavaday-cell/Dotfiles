#!/usr/bin/env python3
"""Run i3status and prepend a minimal Wi-Fi traffic block."""

import json
import os
import signal
import subprocess
import sys
import time

I3STATUS_CONFIG = os.path.expanduser("~/.config/i3/i3status.conf")
_last = {"time": None, "rx": 0, "tx": 0}


def wifi_interface():
    """Return the first wireless interface, falling back to any non-lo one."""
    try:
        names = [n for n in os.listdir("/sys/class/net") if n != "lo"]
    except OSError:
        return None

    for name in names:
        if os.path.isdir(f"/sys/class/net/{name}/wireless"):
            return name
    for name in names:
        try:
            with open(f"/sys/class/net/{name}/operstate") as fh:
                if fh.read().strip() == "up":
                    return name
        except OSError:
            pass
    return None


def fmt_rate(value):
    """Format bytes/second compactly, e.g. 532B, 12K, 1.2M."""
    units = (("G", 1e9), ("M", 1e6), ("K", 1e3))
    for index, (unit, factor) in enumerate(units):
        if value >= factor:
            scaled = value / factor
            if scaled >= 999.5 and index > 0:
                unit, factor = units[index - 1]
                scaled = value / factor
            return f"{scaled:.1f}{unit}" if scaled < 10 else f"{scaled:.0f}{unit}"
    return f"{value:.0f}B"


def traffic_block():
    iface = wifi_interface()
    if not iface:
        return None

    try:
        with open(f"/sys/class/net/{iface}/statistics/rx_bytes") as fh:
            rx = int(fh.read())
        with open(f"/sys/class/net/{iface}/statistics/tx_bytes") as fh:
            tx = int(fh.read())
    except (OSError, ValueError):
        return None

    now = time.monotonic()
    down = up = 0.0
    if _last["time"] is not None:
        elapsed = now - _last["time"]
        if elapsed > 0:
            down = max(0, rx - _last["rx"]) / elapsed
            up = max(0, tx - _last["tx"]) / elapsed

    _last.update(time=now, rx=rx, tx=tx)

    return {
        "name": "wifi_traffic",
        "full_text": f"↓ {fmt_rate(down)}/s ↑ {fmt_rate(up)}/s",
        "markup": "none",
    }


def main():
    proc = subprocess.Popen(
        ["i3status", "-c", I3STATUS_CONFIG],
        stdout=subprocess.PIPE,
        text=True,
        bufsize=1,
    )

    def terminate(_signum, _frame):
        proc.terminate()
        try:
            proc.wait(timeout=2)
        except subprocess.TimeoutExpired:
            proc.kill()
        sys.exit(0)

    signal.signal(signal.SIGTERM, terminate)
    signal.signal(signal.SIGINT, terminate)

    assert proc.stdout is not None
    for line in proc.stdout:
        stripped = line.strip()

        # i3status streams a JSON array: subsequent elements start with ",[".
        prefix = ""
        body = stripped
        if body.startswith(","):
            prefix = ","
            body = body[1:]

        if body.startswith("[") and body.endswith("]"):
            try:
                blocks = json.loads(body)
            except json.JSONDecodeError:
                sys.stdout.write(line)
                sys.stdout.flush()
                continue

            block = traffic_block()
            if block:
                blocks.insert(0, block)
            sys.stdout.write(prefix + json.dumps(blocks, separators=(",", ":")) + "\n")
        else:
            sys.stdout.write(line)
        sys.stdout.flush()


if __name__ == "__main__":
    main()
