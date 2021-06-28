(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "127.0.0.1:7890")
     ("https" . "127.0.0.1:7890")))

(setq inhibit-startup-message t)           ; Make startup clean

(scroll-bar-mode -1)                       ; Disable scroll bar
(tool-bar-mode -1)                         ; Disable toolbar
(tooltip-mode -1)                          ; Disable tooltip
(menu-bar-mode -1)                         ; Disable menubar
(set-fringe-mode 10)                       ; Give it some breathing room

(load-theme 'wombat)
(when window-system (set-frame-size (selected-frame) 160 36))
(set-face-attribute 'default nil :font "FiraMono Nerd Font Mono" :height 108)       ; Set font and font size

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
 '(package-selected-packages '(doom-modeline swiper ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package swiper
  :bind(
	("C-s" . swiper)
   )
  :ensure t
)

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
  :hook (after-init . ivy-mode)
  )

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15))
)



