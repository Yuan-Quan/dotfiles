
(setq inhibit-startup-message t)           ; Make startup clean

(scroll-bar-mode -1)                       ; Disable scroll bar
(tool-bar-mode -1)                         ; Disable toolbar
(tooltip-mode -1)                          ; Disable tooltip
(menu-bar-mode -1)                         ; Disable menubar
(set-fringe-mode 10)                       ; Give it some breathing room

(set-face-attribute 'default nil :font "FiraMono Nerd Font Mono" :height 128)       ; Set font and font size

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
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
