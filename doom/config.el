;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; Wrayth generates this theme from the shell's colour profile.  The theme
;; file is rewritten by wrayth-theme-sync and reloaded live by lisp/wrayth.el.
(setq doom-theme 'noctalia)

;; Keep the editor font in step with the rest of the desktop.  JetBrainsMono
;; Nerd Font carries the icon glyphs treemacs/doom-modeline ask for.
(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 14)
      doom-symbol-font (font-spec :family "JetBrainsMono Nerd Font Mono"))
(setq nerd-icons-font-family "JetBrainsMono Nerd Font Mono")

;; 5px of breathing room between the frame edge and the text.
(add-to-list 'default-frame-alist '(internal-border-width . 5))
(add-to-list 'initial-frame-alist '(internal-border-width . 5))
(when (display-graphic-p)
  (dolist (frame (frame-list))
    (set-frame-parameter frame 'internal-border-width 5)))
;; Specify both a dark and light theme, like so and Doom will choose which one
;; to load based on your system light/dark setting:
;;
;;   (setq doom-theme '(doom-one   . doom-one-light))   ; (DARK . LIGHT)
;;
;; If you want more pro-active theme switching based on OS light/dark mode, look
;; up the `auto-dark' package.

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Project sidebar ---------------------------------------------------------
;; Treemacs (the Doom counterpart of nvim-tree).  SPC O P is the requested
;; binding; Doom's default SPC o p stays available too.
(map! :leader
      :desc "Project sidebar (treemacs)" "O P" #'+treemacs/toggle)

(after! treemacs
  ;; A narrower, nvim-tree-ish sidebar, and follow the file you're editing.
  (setq treemacs-width 30)
  (treemacs-follow-mode 1))

;; Compact tab line ---------------------------------------------------------
;; Only show the centaur-tabs line when the workspace has two or more buffers,
;; and keep it short.  Tab switching is on SPC H / SPC L (and gt / gT).
(after! centaur-tabs
  (setq centaur-tabs-height 24
        ;; No bar or underline on the active tab; brightness and weight are
        ;; enough for the flat Zed/Neovim look.
        centaur-tabs-set-bar nil
        centaur-tabs-set-close-button nil
        centaur-tabs-set-icons t
        centaur-tabs-gray-out-icons 'buffer
        centaur-tabs-set-modified-marker t)

  (defun +wrayth-tabs-restyle ()
    "Blend the tab line into the editor and use the editor font."
    (let ((bg (face-attribute 'default :background nil 'default))
          (fg (face-attribute 'default :foreground nil 'default))
          (family (face-attribute 'default :family nil 'default)))
      ;; centaur-tabs pads the empty part of the tab line with this colour.
      (setq centaur-tabs-background-color bg)
      ;; Emacs' stock `tab-line' face inherits `variable-pitch' at 90% size;
      ;; override it so tabs look like buffer text.
      (when (fboundp 'centaur-tabs-headline-match)
        (centaur-tabs-headline-match))
      (when (fboundp 'centaur-tabs-change-fonts)
        (centaur-tabs-change-fonts family 100))
      (set-face-attribute 'tab-line nil
                          :inherit 'default
                          :family family
                          :height 1.0
                          :background bg
                          :foreground fg
                          :box nil :overline nil :underline nil)))

  ;; Reapply on every Wrayth profile switch, because load-theme recalculates
  ;; the centaur-tabs and tab-line faces.
  (add-hook 'doom-load-theme-hook #'+wrayth-tabs-restyle)
  (add-hook 'server-after-make-frame-hook #'+wrayth-tabs-restyle)
  (+wrayth-tabs-restyle)

  ;; Returning nil from `centaur-tabs-line' collapses the tab line without
  ;; touching `tab-line-format', so centaur-tabs still considers itself on.
  (defun +wrayth-tabs-line-a (orig &rest args)
    "Only draw the tab line when at least two buffers are open."
    (when (>= (length (+tabs-buffer-list)) 2)
      (apply orig args)))

  (advice-add #'centaur-tabs-line :around #'+wrayth-tabs-line-a))

(map! :leader
      :desc "Previous tab" "H" #'+tabs:previous-or-goto
      :desc "Next tab"     "L" #'+tabs:next-or-goto)

;; Terminal ----------------------------------------------------------------
;; The Neovim muscle memory: C-, toggles a terminal popup in the project
;; root.  Doom's own SPC o t / SPC o T keep working too.
(setq vterm-always-compile-module t)
(map! :desc "Toggle terminal" "C-," #'+vterm/toggle)

;; Live Wrayth theme -------------------------------------------------------
;; Watches ~/.config/doom/themes/wrayth-theme.el and re-applies it when the
;; shell profile changes (wrayth-theme-sync rewrites that file).
(load! "lisp/wrayth")
