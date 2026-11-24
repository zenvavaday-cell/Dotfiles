;;; strata-theme.el --- Amber Strata for Doom Emacs -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Palette ported from CoolRetroTermAmber, as used by zclar/ghostty-strata.
;; A warm amber CRT theme that matches the Strata kitty/Neovim themes.
;;
;;; Code:

(require 'doom-themes)

(defgroup strata-theme nil
  "Options for the `strata' theme."
  :group 'doom-themes)

(defcustom strata-padded-modeline doom-themes-padded-modeline
  "If non-nil, add a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'strata-theme
  :type '(choice integer boolean))

(def-doom-theme strata
  "A warm amber CRT theme built around the Amber Strata palette."
  :background-mode 'dark

  ;; name        default    256          16
  ((bg          '("#100902" "#100902" "black"))
   (bg-alt      '("#1B0F04" "#1B0F04" "black"))
   (bg-alt2     '("#3A2008" "#3A2008" "brightblack"))
   (base0       '("#0B0601" "#0B0601" "black"))
   (base1       '("#100902" "#100902" "black"))
   (base2       '("#1B0F04" "#1B0F04" "brightblack"))
   (base3       '("#2B1806" "#2B1806" "brightblack"))
   (base4       '("#5C3614" "#5C3614" "brightblack"))
   (base5       '("#866F26" "#866F26" "brightblack"))
   (base6       '("#B97A26" "#B97A26" "brightblack"))
   (base7       '("#DC841C" "#DC841C" "brightblack"))
   (base8       '("#FFC34D" "#FFC34D" "brightwhite"))
   (fg          '("#EA851D" "#EA851D" "brightwhite"))
   (fg-alt      '("#F29A24" "#F29A24" "brightwhite"))

   (grey        '("#8C5012" "#8C5012" "brightblack"))
   (red         '("#B9370C" "#B9370C" "red"))
   (magenta     '("#A53E22" "#A53E22" "magenta"))
   (violet      '("#F57D3E" "#F57D3E" "brightmagenta"))
   (orange      '("#FF8C1A" "#FF8C1A" "brightred"))
   (yellow      '("#EB9114" "#EB9114" "yellow"))
   (dark-yellow '("#B97A26" "#B97A26" "yellow"))
   (teal        '("#F2B748" "#F2B748" "brightcyan"))
   (green       '("#CDAA24" "#CDAA24" "green"))
   (dark-green  '("#787012" "#787012" "green"))
   (blue        '("#B97A26" "#B97A26" "blue"))
   (dark-blue   '("#5C3614" "#5C3614" "blue"))
   (cyan        '("#F2B748" "#F2B748" "brightcyan"))
   (dark-cyan   '("#866F26" "#866F26" "cyan"))
   (my-black    '("#0B0601" "#0B0601" "black"))

   ;; Face categories
   (highlight   '("#FFB52E" "#FFB52E" "brightyellow"))
   (vertical-bar bg-alt2)
   (selection   '("#6A3C0D" "#6A3C0D" "brightblack"))
   (builtin     orange)
   (comments    grey)
   (doc-comments (doom-lighten fg-alt 0.2))
   (constants   violet)
   (functions   green)
   (keywords    red)
   (methods     green)
   (operators   fg)
   (type        yellow)
   (strings     green)
   (variables   fg)
   (numbers     violet)
   (region      selection)
   (error       red)
   (warning     yellow)
   (success     green)

   (vc-modified (doom-darken cyan 0.15))
   (vc-added    (doom-darken green 0.15))
   (vc-deleted  (doom-darken red 0.15))

   ;; Mode line / custom
   (-modeline-pad
    (when strata-padded-modeline
      (if (integerp strata-padded-modeline)
          strata-padded-modeline
        4)))
   (modeline-bg bg-alt2)
   (modeline-fg base8)
   (modeline-inactive-bg bg)
   (modeline-inactive-fg grey)
   (org-quote `(,(doom-lighten (car bg) 0.08) "#1A0E03")))

  ;;;; Face overrides
  ((button :foreground cyan :underline t :weight 'bold)
   (cursor :background highlight)
   (fringe :background bg)
   (header-line :background bg-alt :foreground fg-alt)
   (hl-line :background base3)
   ((line-number &override) :foreground base5)
   ((line-number-current-line &override) :background base3 :foreground highlight)
   (isearch :foreground base0 :background highlight)
   (lazy-highlight :background yellow :foreground base0
                   :distant-foreground base0 :bold bold)
   ((link &override) :foreground cyan :underline t)
   (minibuffer-prompt :foreground highlight :weight 'bold)
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-inactive-bg :foreground modeline-inactive-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-inactive-bg)))
   (mode-line-emphasis :foreground highlight :weight 'bold)
   (region :background selection :foreground base8 :extend t)
   (secondary-selection :background bg-alt2 :foreground base8)
   (vertical-border :foreground base5)
   (shadow :foreground grey)
   (success :foreground green :weight 'bold)
   (warning :foreground yellow :weight 'bold)
   (error :foreground red :weight 'bold)
   (escape-glyph :foreground cyan)
   (homoglyph :foreground cyan)
   (trailing-whitespace :background red)
   (show-paren-match :foreground highlight :background base3 :weight 'bold)
   (show-paren-mismatch :foreground base0 :background red)

   ;; Doom modeline
   (doom-modeline-bar :background highlight)
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'normal)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'normal)
   (doom-modeline-buffer-project-root :foreground green :weight 'normal)
   (doom-modeline-info :foreground green)
   (doom-modeline-warning :foreground yellow)
   (doom-modeline-urgent :foreground red)

   ;; Org
   (org-hide :foreground bg)
   (org-document-title :foreground highlight :weight 'bold :height 1.15)
   (org-document-info :foreground fg-alt)
   (org-level-1 :foreground orange :weight 'bold)
   (org-level-2 :foreground yellow :weight 'bold)
   (org-level-3 :foreground green :weight 'bold)
   (org-level-4 :foreground teal)
   (org-level-5 :foreground violet)
   (org-level-6 :foreground cyan)
   (org-todo :foreground red :weight 'bold)
   (org-done :foreground green :weight 'bold)
   (org-code :foreground orange)
   (org-verbatim :foreground yellow)
   (org-link :foreground cyan :underline t)
   (org-block :background base2 :extend t)
   (org-block-begin-line :foreground grey :background base2 :extend t)
   (org-block-end-line :foreground grey :background base2 :extend t)
   (org-quote :foreground fg-alt :background org-quote :extend t)

   ;; Diffs / VC
   (diff-added :foreground green :background "#1F1603" :extend t)
   (diff-changed :foreground yellow :background "#2A1B05" :extend t)
   (diff-removed :foreground red :background "#2A0D05" :extend t)
   (diff-refine-added :foreground base8 :background "#3A2508")
   (diff-refine-changed :foreground base8 :background "#3A2508")
   (diff-refine-removed :foreground base8 :background "#3A1206")
   (smerge-markers :background base2 :foreground grey)
   (smerge-upper :background "#2A0D05" :extend t)
   (smerge-lower :background "#1F1603" :extend t)

   ;; Git / Magit
   (magit-branch-local :foreground cyan)
   (magit-branch-remote :foreground green)
   (magit-tag :foreground yellow)
   (magit-section-heading :foreground highlight :weight 'bold)
   (magit-diff-added :foreground green :background "#1F1603")
   (magit-diff-added-highlight :foreground green :background "#2A1D05")
   (magit-diff-removed :foreground red :background "#2A0D05")
   (magit-diff-removed-highlight :foreground red :background "#3A1206")
   (magit-diff-context :foreground base6)
   (magit-diff-context-highlight :foreground base7 :background base2)
   (magit-hash :foreground grey)

   ;; Completion / minibuffer
   (corfu-current :background selection :foreground base8)
   (corfu-border :background base5 :foreground base5)
   (vertico-current :background selection :foreground base8 :extend t)
   (vertico-group-title :foreground highlight :weight 'bold)
   (orderless-match-face-0 :foreground highlight :weight 'bold)
   (orderless-match-face-1 :foreground yellow :weight 'bold)
   (orderless-match-face-2 :foreground orange :weight 'bold)
   (orderless-match-face-3 :foreground green :weight 'bold)
   (consult-preview-match :background selection :foreground base8)
   (consult-line-number :foreground base5)
   (company-tooltip :foreground fg :background bg-alt)
   (company-tooltip-selection :background selection :foreground base8)
   (company-tooltip-annotation :foreground green)
   (company-tooltip-search :foreground highlight :weight 'bold)
   (company-scrollbar-bg :background bg)
   (company-scrollbar-fg :background base5)

   ;; Treemacs / tabs
   (treemacs-root-face :foreground highlight :weight 'bold :height 1.1)
   (treemacs-directory-face :foreground cyan)
   (treemacs-file-face :foreground fg)
   (treemacs-git-modified-face :foreground yellow)
   (treemacs-git-added-face :foreground green)
   (treemacs-git-deleted-face :foreground red)
   (treemacs-tag-follow-mode-face :background base2 :foreground base8)
   (centaur-tabs-default :background bg-alt :foreground grey)
   (centaur-tabs-selected :background highlight :foreground base0)
   (centaur-tabs-unselected :background bg-alt :foreground base6)
   (centaur-tabs-selected-modified :background highlight :foreground base0)
   (centaur-tabs-unselected-modified :background bg-alt :foreground yellow)
   (centaur-tabs-active-bar-face :background highlight)
   (centaur-tabs-modified-marker-selected :foreground base0)
   (centaur-tabs-modified-marker-unselected :foreground yellow)

   ;; Dired / flycheck / misc
   (dired-directory :foreground cyan :weight 'bold)
   (dired-symlink :foreground violet)
   (dired-ignored :foreground grey)
   (dired-marked :foreground highlight :weight 'bold)
   (web-mode-html-tag-face :foreground cyan)
   (web-mode-html-tag-bracket-face :foreground (doom-darken cyan 0.4))
   (web-mode-html-attr-name-face :foreground yellow)
   (markdown-header-face :foreground orange :weight 'bold)
   (markdown-code-face :background base2 :extend t)
   (markdown-link-face :foreground cyan :underline t)
   (markdown-url-face :foreground violet))

  ;;;; Variable overrides
  ())

;;; strata-theme.el ends here
