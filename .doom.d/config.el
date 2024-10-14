;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Andy Zhang"
      user-mail-address "herder.fern-0z@icloud.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "Iosevka Nerd Font Mono" :size 14 :width 'expanded)
      doom-variable-pitch-font (font-spec :family "Iosevka Nerd Font Mono" :size 14 :width 'expanded))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme (if (display-graphic-p) 'kaolin-light 'kaolin-galaxy))
(setq doom-theme 'kaolin-galaxy)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Disable menu-bar-mode in terminal
(menu-bar-mode (if (display-graphic-p) 1 -1))

;; Disable auto backup for tramp files
(add-to-list 'backup-directory-alist
             (cons tramp-file-name-regexp nil))

(setq scroll-margin 5
      tab-always-indent 'complete
      ;; start gzip when in tramp-mode from 4MB
      tramp-inline-compress-start-size 40960
      tramp-inline-compress-commands '(("bzip2" "bzip2 -d")
                                       ("xz" "xz -d")))

(add-to-list 'default-frame-alist '(height . 75))
(add-to-list 'default-frame-alist '(width . 130))

(after! evil-snipe
  (setq evil-snipe-scope 'whole-buffer
        evil-snipe-repeat-scope 'whole-buffer))

(after! pyim
  (setq pyim-default-scheme 'xiaohe-shuangpin
        pyim-page-tooltip 'posframe))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! evil
  (setq evil-split-window-below t
        evil-vsplit-window-right t))

(map! :leader
      :desc "Auto format" :n "ta" #'format-all-mode
      :n "sc" #'evil-ex-nohighlight
      :desc "No search highlight" "/" #'evil-ex-nohighlight
      :g "SPC" nil
      :n "w/" #'evil-window-vsplit
      :n "w-" #'evil-window-decrease-height)

(map! :leader
      :desc "Magit status" :n "gs" #'magit-status)

(map! :m "<up>" #'evil-window-up
      :m "<down>" #'evil-window-down
      :m "<left>" #'evil-window-left
      :m "<right>" #'evil-window-right
      :m "<H-left>" #'+evil/window-move-left
      :m "<H-right>" #'+evil/window-move-right
      :m "<H-up>" #'+evil/window-move-up
      :m "<H-down>" #'+evil/window-move-down
      :m "<M-left>" #'+evil/window-move-left
      :m "<M-right>" #'+evil/window-move-right
      :m "<M-up>" #'+evil/window-move-up
      :m "<M-down>" #'+evil/window-move-down
      :m "ESC <left>" #'+evil/window-move-left
      :m "ESC <right>" #'+evil/window-move-right
      :m "ESC <up>" #'+evil/window-move-up
      :m "ESC <down>" #'+evil/window-move-down
      :m "<mouse-4>" #'evil-scroll-line-up
      :m "<mouse-5>" #'evil-scroll-line-down
      :i "<backtab>" #'evil-shift-left-line)

(after! evil-easymotion
  (map! :prefix "g" :m "s=" #'evilem-motion-next-line-first-non-blank))

(map! :leader
      :prefix ("SPC" . "Custom jump")
      :m "j" #'avy-goto-line-below
      :m "k" #'avy-goto-line-above
      :m "w" #'avy-goto-char-2)
(map! :m "<C-i>" 'better-jumper-jump-forward)
(map! (:when (featurep! :ui window-select +numbers)
       :leader
       :n "1" #'winum-select-window-1
       :n "2" #'winum-select-window-2
       :n "3" #'winum-select-window-3
       :n "4" #'winum-select-window-4
       :n "5" #'winum-select-window-5
       :n "6" #'winum-select-window-6
       :n "7" #'winum-select-window-7
       :n "8" #'winum-select-window-8
       :n "9" #'winum-select-window-9
       :n "0" #'treemacs-select-window))

(global-subword-mode -1)
(global-display-fill-column-indicator-mode 1)

;; (after! ivy
;;   ;; TODO move these to autoload
;;   (defun +ivy-find-file-other-window-action (x)
;;     "Opens the current candidate in another window."
;;     (select-window
;;      (with-ivy-window
;;        (find-file-other-window (expand-file-name x))
;;        (selected-window))))
;;   (defun +ivy/find-file-other-window-action ()
;;     "Open the current counsel-{ag,rg,git-grep} candidate in other-window."
;;     (interactive)
;;     (ivy-set-action #'+ivy-find-file-other-window-action)
;;     (setq ivy-exit 'done)
;;     (exit-minibuffer))
;;   (map! :map ivy-minibuffer-map
;;         "C-t" #'+ivy/find-file-other-window-action
;;         "C-M-l" #'ivy-immediate-done
;;         "<C-return>" #'+ivy/find-file-other-window-action))

(map! :map magit-status-mode-map
      :prefix "g"
      "j" nil
      "k" nil)
(map! :map magit-status-mode-map
      :prefix "g"
      "j" #'magit-section-forward
      "k" #'magit-section-backward)

(after! company
  ;; (map! :map company-active-map
  ;;       "TAB" #'company-complete-selection
  ;;       "<tab>" #'company-complete-selection
  ;;       "RET" nil
  ;;       "<return>" nil)
  (setq company-box-doc-enable t
        company-box-doc-delay 1))

(defun doom-modeline-conditional-buffer-encoding ()
  "We expect the encoding to be LF UTF-8, so only show the modeline when this is not the case"
  (setq-local doom-modeline-buffer-encoding
              (unless (or (eq buffer-file-coding-system 'utf-8-unix)
                          (eq buffer-file-coding-system 'utf-8)))))
(add-hook 'find-file-hook #'doom-modeline-conditional-buffer-encoding)

;; (map! :map ivy-minibuffer-map
;;       "M-o" nil)

;; (map! :map ivy-minibuffer-map
;;       "M-o" #'my-hydra-ivy/body)

;; SSH config
;; (add-to-list 'auto-mode-alist '("/\\.ssh/config\\'"     . ssh-config-mode))
;; (add-to-list 'auto-mode-alist '("/sshd?_config\\'"      . ssh-config-mode))
;; (add-to-list 'auto-mode-alist '("/knownhosts\\'"        . ssh-known-hosts-mode))
;; (add-to-list 'auto-mode-alist '("/authorized_keys2?\\'" . ssh-authorized-keys-mode))
;; (add-hook 'ssh-config-mode-hook 'turn-on-font-lock)

(after! smartparens
  (sp-local-pair '(python-mode) "f\"" "\"")
  (sp-local-pair '(python-mode) "f'" "'")
  (sp-local-pair '(python-mode) "r\"" "\"")
  (sp-local-pair '(python-mode) "r'" "'"))

;; (setq +lsp-company-backends '(:separate
;;                                company-capf
;;                                company-tabnine))
;; (setq company-backends '((:separate company-capf company-tabnine) (company-dabbrev-code company-keywords)))
(setq company-backends '((:separate company-capf) (company-dabbrev-code company-keywords)))

(winum-mode 1)
(setq vc-ignore-dir-regexp
      (format "%s\\|%s"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
(setq tramp-verbose 5)

(defmacro set-line-number-type (TYPE)
  "Sets current window's line number type to TYPE only if display-line-number-mode is active"
  `(if display-line-numbers (setq-local display-line-numbers ,TYPE)))

(defun adaptive-relative-line-number ()
  (let ((buffer-in-this-window (current-buffer)))
    (if display-line-numbers
        (set-line-number-type 'relative))
    (if (and (boundp 'doom--last-window) doom--last-window (window-valid-p doom--last-window))
        (with-selected-window doom--last-window
          (unless (eq buffer-in-this-window (current-buffer))
            (set-line-number-type t))))))

(add-hook 'doom-switch-window-hook #'adaptive-relative-line-number)
(add-hook 'find-file-hook #'(lambda () (set-line-number-type 'relative)))
(add-to-list 'auto-mode-alist '("\\.ya?ml\\.gotmpl" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.mdx" . markdown-mode))
(add-to-list 'auto-mode-alist '("/inventory/.+" . conf-windows-mode))
;; (add-hook 'yaml-mode-hook #'(lambda () (spell-fu-mode -1)))
(add-hook 'yaml-mode-hook #'(lambda () (flycheck-mode -1)))

(defun doom/ediff-init-and-example ()
  "ediff the current `init.el' with the example in doom-emacs-dir"
  (interactive)
  (ediff-files (concat doom-private-dir "init.el")
               (concat doom-emacs-dir "init.example.el")))

(map! :map help-map "di" #'doom/ediff-init-and-example)

(after! evil-goggles
  (custom-set-faces
   '(evil-goggles-default-face ((t (:inherit 'nav-flash-face)))))
  (setq evil-goggles-duration 0.2))
(setq projectile-files-cache-expire 30)

(setq-default word-wrap nil
              fill-column 100)

;; (setq url-proxy-services
;;    '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
;;      ("http" . "127.0.0.1:7890")))
(setq lsp-file-watch-threshold nil)
(setq which-key-idle-delay 0.6)
(setq which-key-idle-secondary-delay 0.2)

(set-formatter! 'yapf "yapf" :modes '(python-mode))
(setq-hook! 'python-mode-hook +format-with-lsp nil)
(setq-hook! 'python-mode-hook +format-with 'yapf)
;; (add-hook 'python-mode-hook #'format-all-mode)
(setq-hook! 'python-mode-hook fill-column 130)

;; (use-package! poly-yaml)

;; Magit
(remove-hook 'server-switch-hook 'magit-commit-diff)
