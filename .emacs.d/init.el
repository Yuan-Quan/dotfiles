
(setq inhibit-startup-message t)           ; Make startup clean

(scroll-bar-mode -1)                       ; Disable scroll bar
(tool-bar-mode -1)                         ; Disable toolbar
(tooltip-mode -1)                          ; Disable tooltip
(menu-bar-mode -1)                         ; Disable menubar
(set-fringe-mode 10)                       ; Give it some breathing room

(if (require 'doom-themes nil 'noerror)
  (load-theme 'doom-city-lights t)
  (load-theme 'wombat))
(when window-system (set-frame-size (selected-frame) 160 36))
(set-face-attribute 'default nil :font "FiraCode Nerd Font Mono" :height 100)       ; Set font and font size

;; Enable line numbers 
(global-display-line-numbers-mode t)
(column-number-mode)

;; Enable line numbers for some modes
(dolist (mode '(text-mode-hook
                prog-mode-hook
                conf-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 1))))

;; Override some modes which derive from the above
(dolist (mode '(org-mode-hook
		eshell-mode-hook
		term-mode-hook
		shell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
			 ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(visual-fill-column magit doom-themes helpful counsel ivy-rich which-key rainbow-delimiters doom-modeline swiper ivy command-log-mode use-package))
 '(which-key-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package unicode-fonts)

(use-package swiper
  :bind(
	("C-s" . swiper)
   )
  :ensure t
)

(use-package counsel
  :demand t
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         ;; ("C-M-j" . counsel-switch-buffer)
         ("C-M-l" . counsel-imenu)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :bind (
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)	
         ("C-l" . ivy-alt-done)
         :map ivy-switch-buffer-map
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-d" . ivy-reverse-i-search-kill)
   )
  :config
    (ivy-mode 1)
  :hook (after-init . ivy-mode))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package all-the-icons)

(use-package doom-themes)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.3))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :ensure t
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . helpful-function)
  ([remap describe-symbol] . helpful-symbol)
  ([remap describe-variable] . helpful-variable)
  ([remap describe-command] . helpful-command)
  ([remap describe-key] . helpful-key))

(use-package magit
  :ensure t)

(defun cfg/org-mode-setup ()
    (org-indent-mode)
    (visual-line-mode 1))

(use-package org
	:hook (org-mode . cfg/org-mode-setup)
        :config
	(setq org-ellipsis " ▼"
		org-hide-emphasis-markers t))

(use-package org-bullets
	:after org
	:hook (org-mode . org-bullets-mode)
	:custom
	(org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

;; Set faces for heading levels
(with-eval-after-load 'org-faces
	(dolist (face '((org-level-1 . 1.2)
	                (org-level-2 . 1.1)
		        (org-level-3 . 1.05)
		        (org-level-4 . 1.0)
		        (org-level-5 . 1.1)
		        (org-level-6 . 1.1)
		        (org-level-7 . 1.1)
		        (org-level-8 . 1.1)))
	(set-face-attribute (car face) nil :font "Segoe UI" :weight 'bold :height (cdr face))))

(defun cfg/org-mode-visual-fill ()
    (setq visual-fill-column-width 120
          visual-fill-column-center-text t)
      (visual-fill-column-mode 1))

(use-package visual-fill-column
       :hook (org-mode . cfg/org-mode-visual-fill))
