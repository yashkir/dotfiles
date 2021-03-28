;; Https://github.com/daviwil/emacs-from-scratch
;; TODO
;; * set up custom bindings, video 3
;;
;; Clean up the UI
;; -------------------------------------
(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(blink-cursor-mode -1)
(menu-bar-mode -1)
(show-paren-mode t)
(column-number-mode)
(global-display-line-numbers-mode t)
(add-hook 'term-mode-hook (lambda () (display-line-numbers-mode 0)))

(setq visible-bell t)

;;(set-face-attribute 'default nil :font "Fira Code" :height 110)
(set-face-attribute 'default nil :font "Iosevka Extended" :height 102)


;; BINDS
;; -------------------------------------
;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key (kbd "C-c C-t") 'counsel-load-theme)
(global-set-key (kbd "C-c C-d") #'helpful-at-point)

;; Initialize Packages
;; -------------------------------------
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

;; Autocompletion
;; TODO set up more keybindings as per https://www.youtube.com/watch?v=74zOY-vgkyw
;; Alt-o gives extra options
(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line))
  :config
  (ivy-mode 1))

;; Extra information about commands for ivy/counsel
(use-package ivy-rich
  :init (ivy-rich-mode 1))

(global-set-key (kbd "C-M-j") 'counsel-switch-buffer)

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x C-f" . counsel-find-file)
	 ))

(use-package swiper)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-Iosvkem t))

;; EVIL
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backwards-char-and-join)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state))

;; Setups for evil
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  (when (file-directory-p "~/projects")
    (setq projectile-project-search-path '("~/projects")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit)
  ;;:custom
  ;;(magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

;;(use-package tide) ;Typescript
(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package company
  :after lsp-mode
  :hook (lsp-mode . company-mode)
  :bind (:map company-active-map
	  ("<tab>" . company-complete-selection)
	 :map lsp-mode-map
	  ("<tab>" . company-indent-or-complete-common)))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package git-gutter) ;;Todo auto load

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("83ac1bf88b54b3cdb9f064149be4a77cb7854e3fd7e791d9b9c1b9b3c3834c39" "990e24b406787568c592db2b853aa65ecc2dcd08146c0d22293259d400174e37" default))
 '(global-git-gutter-mode t)
 '(package-selected-packages
   '(evil-nerd-commenter jbeans-emacs-emacs company-box company git-gutter lsp-mode lsp-mod magit evil-magit projectile evil-collection evil which-key use-package rainbow-delimiters ivy-rich helpful doom-themes doom-modeline counsel command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
