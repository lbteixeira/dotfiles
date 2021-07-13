;;; package --- Summary
;; No summary is provided, since this config is organized using an org file.
;;
;;; Commentary:
;; This config should be modified using its companion org file.
;;; Code:

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			     ("org" . "https://orgmode.org/elpa/")
			     ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq visible-bell t)
(setq-default fill-column 100)

(set-face-attribute 'default nil :font "Roboto Mono Nerd Font" :height 100)

(use-package doom-themes
  :init (load-theme 'doom-dracula t))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "<f4>"    ) 'ranger)
(global-set-key (kbd "<f5>"    ) 'eval-buffer)
(global-set-key (kbd "<f6>"    ) 'org-babel-tangle)
(global-set-key (kbd "<f7>"    ) 'magit)
(global-set-key (kbd "<f8>"    ) 'treemacs)
(global-set-key (kbd "<f9>"    ) 'follow-delete-other-windows-and-split)
(global-set-key (kbd "C-="     ) 'text-scale-increase)
(global-set-key (kbd "C--"     ) 'text-scale-decrease)
(global-set-key (kbd "C-c c"   ) 'comment-line)
(global-set-key (kbd "C-7"     ) 'save-buffer)
(global-set-key (kbd "C-8"     ) 'kill-current-buffer)
(global-set-key (kbd "C-M-j"   ) 'counsel-switch-buffer)
(global-set-key (kbd "M-H"     ) 'shrink-window-horizontally)
(global-set-key (kbd "M-L"     ) 'enlarge-window-horizontally)
(global-set-key (kbd "M-K"     ) 'shrink-window)
(global-set-key (kbd "M-J"     ) 'enlarge-window)

;; (global-unset-key (kbd "M-d"))
;; (global-unset-key (kbd "M-a"))
;; (global-unset-key (kbd "M-s"))

(add-to-list 'load-path "~/.emacs.d/downloads/")

(use-package all-the-icons)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-buffer-encoding nil)
  (setq doom-modeline-env-enable-python t))

(column-number-mode)
(global-display-line-numbers-mode t)
(setq display-line-numbers-type 'relative)

;; Disable line numbers for some modes
(dolist (mode '(shell-mode-hook
		    term-mode-hook
		    eshell-mode-hook))
  ;; This is kind of a loop over the values in the list of modes
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(fset 'yes-or-no-p 'y-or-n-p)

(setq backup-directory-alist `((".*" . "~/.cache/emacs/backup")))
(setq auto-save-file-name-transforms `((".*" "~/.cache/emacs/autosave" t)))
(setq delete-by-moving-to-trash t)
(setq trash-directory "~/Trash")

(setq confirm-kill-emacs 'y-or-n-p)

(use-package tab-jump-out
  :ensure t
  :hook (prog-mode . tab-jump-out-mode)
  :hook (LaTeX-mode . tab-jump-out-mode)
  :hook (org-mode . tab-jump-out-mode))

(require 'hl-line)
(global-hl-line-mode t)

(use-package avy
  :ensure t
  :defer t)
(global-set-key (kbd "M-a") 'avy-goto-char)
(global-set-key (kbd "M-s") 'avy-goto-char-2)

(use-package company
:ensure t
:config
(setq company-idle-delay 0)
(setq company-minimum-prefix-lenght 3)

(global-company-mode t))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	   ("C-x b" . counsel-ibuffer)
	   ("C-x C-f" . counsel-find-file)
  :map minibuffer-local-map
	 ("C-r" . 'counsel-minibuffer-history)))

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook))

;; Set the title
(setq dashboard-banner-logo-title "Welcome to Emacs!")
;; Set the banner
(setq dashboard-startup-banner 'logo)
;; Value can be
;; 'official which displays the official emacs logo
;; 'logo which displays an alternative emacs logo
;; 1, 2 or 3 which displays one of the text banners
;; "path/to/your/image.png" or "path/to/your/text.txt" which displays whatever image/text you would prefer

;; Content is not centered by default. To center, set
(setq dashboard-center-content t)

;; To disable shortcut "jump" indicators for each section, set
;; (setq dashboard-show-shortcuts nil)

(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
;; (add-to-list 'dashboard-items '(agenda) t)
;; (setq dashboard-week-agenda t)

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-tree)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "j") 'exit-insert-mode)
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (define-key evil-normal-state-map (kbd "$") 'evil-end-of-visual-line)
  (define-key evil-normal-state-map (kbd "a") 'evil-append-line)
  (define-key evil-normal-state-map (kbd "A") 'evil-append)
  (define-key evil-normal-state-map (kbd "ç") 'save-buffer)

  ;; Set the initial state for a given mode
  (evil-set-initial-state 'shell-buffer-mode 'insert))

(defun exit-insert-mode ()
  (interactive)
  (let ((ch (read-char-exclusive)))
    (if (eq ?j ch)
        (evil-force-normal-state)
      (insert "j" (string ch)))))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-snipe)
(evil-snipe-mode +1)
(evil-snipe-override-mode +1)
(setq evil-snipe-scope 'whole-line)

(push '(?\[ "[[{(]") evil-snipe-aliases)

(use-package evil-multiedit)

;; (require 'fill-column-indicator)
;; (setq fci-rule-width 1)
;; (setq fci-rule-color "blue")
;; (setq fci-rule-column 80)

(use-package flycheck)
(global-flycheck-mode)

(use-package helpful
  :defer t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package iedit
  :defer t)
(use-package evil-iedit-state) ;; check
;; check how to go to next/previous instance
(define-key global-map (kbd "C-c o") 'iedit-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	   :map ivy-minibuffer-map
	   ("TAB" . ivy-alt-done)
	   ("C-l" . ivy-alt-done)
	   ("C-j" . ivy-next-line)
	   ("C-k" . ivy-previous-line)
	   :map ivy-switch-buffer-map
	   ("C-k" . ivy-previous-line)
	   ("C-l" . ivy-done)
	   ("C-d" . ivy-switch-buffer-kill)
	   :map ivy-reverse-i-search-map
	   ("C-k" . ivy-previous-line)
	   ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; (require 'ivy-posframe)

;; (setq ivy-posframe-height-alist '((swiper . 20)
;;                                   (t      . 20)))

;; (setq ivy-posframe-parameters
;;   '((left-fringe . 20)
;;     (left-fringe . 0)))


;;  (setq ivy-posframe-display-functions-alist
;;        '((swiper          . ivy-display-function-fallback)
;;          (counsel-M-x     . ivy-posframe-display-at-frame-top-center)
;;          (t               . ivy-posframe-display)))
;;  (ivy-posframe-mode nil)

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package auctex
  :ensure t
  :defer t)
  ;; :hook (visual-line-mode . LaTeX-mode)
  ;; :hook (follow-mode . LaTeX-mode)
  ;; :hook (flyspell-mode . LaTeX-mode)
  ;; :hook (LaTeX-math-mode . LaTeX-mode))

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(setq lsp-keymap-prefix "C-l")

(use-package lsp-mode
  :ensure t
  :custom
  (lsp-prefer-flymake nil)
  :hook (lsp-mode . lsp-enable-which-key-integration)
  :commands (lsp lsp-deferred))

(use-package lsp-ui
  :after lsp-mode
  :diminish
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :commands lsp-treemacs-errors-list)

(use-package general)
(use-package dap-mode
  :ensure t
  :custom
  (dap-auto-configure-features '(sessions locals tooltop expressions repl))
  :config
  (dap-ui-mode 1)
  (general-define-key
    :keymaps 'lsp-mode-map
    :prefix lsp-keymap-prefix
    "d" '(dap-hydra t :wk "debugger")))

(use-package magit
  :defer t
  :commands (magit-status magit-get-current-branch)
  )

(use-package evil-magit
  :after magit)

(use-package org
  :hook (org-mode . bretx/org-mode-hooks)
  :config
  (setq org-hide-emphasis-markers t
        org-ellipsis " ▾"
	    org-startup-folded 'content
	    org-cycle-separator-lines 2))

(require 'org-indent)

(define-key org-mode-map (kbd "C-<return>") 'org-open-at-point)

(use-package org-superstar
  :after org
  :hook (org-mode . org-superstar-mode)
  :custom
  (org-superstar-remove-leading-stars t)
  (org-superstar-headline-bullets-list '("◉" "○" "●" "○" "●" "○" "●")))

(use-package toc-org)

(dolist (face '((org-level-1 . 1.2)
                (org-level-2 . 1.1)
                (org-level-3 . 1.05)
                (org-level-4 . 1.0)
                (org-level-5 . 1.1)
                (org-level-6 . 1.1)
                (org-level-7 . 1.1)
                (org-level-8 . 1.1))))

(defun bretx/org-mode-hooks ()
  "Hooks for org mode."
  (org-indent-mode)
  (toc-org-mode 1)
  (smartparens-mode 1)
  (visual-line-mode 1))

(org-babel-do-load-languages 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

;; Run the blocks when requested
(setq org-confirm-babel-evaluate nil)

;; Shortcuts to create the blocks for specific languages
(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

;; (use-package origami)
;; (global-origami-mode t)

(use-package pdf-tools
  :defer t)

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/Projects")
    (setq projectile-project-search-path '("~/Projects" "~/Documents")))
  (setq counsel-projectile-switch-project-action 'ranger)
)

(require 'projectile)
(projectile-mode)

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package python-mode
  :defer t
  :hook (python-mode . lsp-deferred)
  :config
  (require 'dap-python)
  (define-key python-mode-map (kbd "<return>") 'newline)
  (elpy-enable))

(use-package elpy
  :ensure t
  :init
  (elpy-enable)
  :config
  (elpy-set-test-runner 'py.test))

(use-package pyvenv
  :defer t
  :ensure t)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode)
  :hook (LaTeX-mode . rainbow-delimiters-mode))

(use-package ranger
  :defer t
  :ensure t
  :commands ranger
  :config (use-package image-dired+
            :ensure t
            :config (image-diredx-async-mode)))

(ranger-override-dired-mode t)
(setq ranger-show-hidden nil)

(use-package smartparens)
(smartparens-global-mode 1)
  ;; :hook (prog-mode . smartparens-mode)
  ;; :hook (LaTeX-mode . smartparens-mode))

(show-paren-mode t)
(setq show-paren-delay 0)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35
          treemacs-workspace-switch-cleanup      nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode nil)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))

(use-package treemacs-evil
  :after treemacs evil
  :ensure t)

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

;; (treemacs-git-mode 'deferred)
;; (with-eval-after-load 'treemacs
;;   (add-to-list 'treemacs-pre-file-insert-predicates #'treemacs-is-file-git-ignored?))

(use-package undo-tree
  :ensure t
  :diminish t
  :config
  (undo-tree-mode)
  (progn
    (setq undo-limit 80000000)
    (setq evil-want-fine-undo nil)
    (setq undo-tree-auto-save-history t)
    (setq undo-tree-history-directory-alist '(("." . "~/.cache/emacs/undo"))))
  :init (global-undo-tree-mode t))

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)
      visual-fill-column-width 100
      visual-fill-column-center-text t)

(add-hook 'visual-line-mode-hook 'visual-fill-column-mode )
(add-hook 'visual-line-mode-hook 'prettify-symbols-mode )

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package writeroom-mode
  :defer t
  :ensure t
  :commands writeroom-mode)

(use-package yasnippet
  :defer t)
(yas-global-mode 1)

(use-package yasnippet-snippets
  :defer t)

(provide 'init)
;;; init.el ends here
