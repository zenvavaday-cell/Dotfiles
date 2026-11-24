;;; lisp/wrayth.el --- live Wrayth theme reload -*- lexical-binding: t; -*-

;; wrayth-theme-sync rewrites themes/wrayth-theme.el whenever the shell's
;; colour profile changes.  Watching the directory (rather than the file)
;; survives the write, and the short debounce collapses the several inotify
;; events a single rewrite produces into one reload.

(defvar wrayth--theme-file
  (expand-file-name "themes/wrayth-theme.el" doom-user-dir))

(defvar wrayth--themes-dir (file-name-directory wrayth--theme-file))

(defvar wrayth--watch nil)
(defvar wrayth--timer nil)

(defun wrayth--theme-active-p ()
  "Return non-nil if the Wrayth theme is the one Doom is using."
  (let ((theme doom-theme))
    (or (eq theme 'wrayth)
        (and (consp theme) (memq 'wrayth theme)))))

(defun wrayth--reload ()
  "Re-read and re-apply the generated Wrayth theme."
  (setq wrayth--timer nil)
  (when (and (wrayth--theme-active-p)
             (file-readable-p wrayth--theme-file))
    (condition-case err
        (progn
          (load wrayth--theme-file nil t t)
          (ignore-errors (disable-theme 'wrayth))
          (load-theme 'wrayth t)
          (message "wrayth: theme reloaded"))
      (error
       (message "wrayth: theme reload failed: %s"
                (error-message-string err))))))

(defun wrayth--queue (&rest _)
  "Debounce theme-file events before reloading."
  (when (timerp wrayth--timer)
    (cancel-timer wrayth--timer))
  (setq wrayth--timer (run-at-time 0.35 nil #'wrayth--reload)))

(defun wrayth--on-event (event)
  (let ((file (nth 2 event)))
    (when (and (stringp file)
               (string= (file-name-nondirectory file) "wrayth-theme.el"))
      (wrayth--queue))))

(defun wrayth-watch-start ()
  "Start watching the generated theme for profile switches."
  (interactive)
  ;; Daemon/batch sessions do not load file notification until asked.
  (require 'filenotify nil t)
  (unless (and wrayth--watch (file-notify-valid-p wrayth--watch))
    (ignore-errors (make-directory wrayth--themes-dir t))
    (when (fboundp 'file-notify-add-watch)
      (setq wrayth--watch
            (file-notify-add-watch wrayth--themes-dir '(change)
                                   #'wrayth--on-event)))))

(defun wrayth-watch-stop ()
  "Stop watching the generated theme."
  (interactive)
  (when (and wrayth--watch (fboundp 'file-notify-valid-p)
             (file-notify-valid-p wrayth--watch))
    (file-notify-remove-watch wrayth--watch))
  (setq wrayth--watch nil)
  (when (timerp wrayth--timer)
    (cancel-timer wrayth--timer))
  (setq wrayth--timer nil))

(if after-init-time
    (wrayth-watch-start)
  (add-hook 'after-init-hook #'wrayth-watch-start))

(provide 'wrayth)
;;; wrayth.el ends here
