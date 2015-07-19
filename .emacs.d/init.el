(require 'package)

;;disable menu bar ontop(menu-bar-mode -99)
(tool-bar-mode -1)

;;add MELPA to repo list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;init package.el
(package-initialize)

;;paren highlighting
(require 'paren)
(setq show-paren-style 'mixed)
(show-paren-mode 1)


;;auto complete
(require 'auto-complete)
;;default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;;init yasnippet 
(require 'yasnippet)
(yas-global-mode 1)

;;enable line number 
(global-linum-mode t)
;;enable auto pair auto indent
(electric-indent-mode 1)
(electric-pair-mode 1)
(electric-layout-mode 1)
;;correct indent to 4 space
(setq-default c-basic-offset 4)

;;EDE is a generic interface for managing projects. It specifies a single set of menus and keybindings, while supporting multiple ways to express a project via a build system.
;;set up cedet ide mode
(global-ede-mode 1)

;;smooth scrolling
(require 'smooth-scrolling)


;;tuareg mode for caml editing 
(require 'tuareg)

;;;;;;;;;;
;; Helm ;;
;;;;;;;;;;


;;Helm is incremental completion and selection narrowing framework for Emacs. It will help steer you in the right direction when you're looking for stuff in Emacs (like buffers, files, etc).
(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-s M-f") 'helm-imenu) ;; show method sigitures
(global-set-key (kbd "M-s M-m") 'helm-man-woman) ;; quick display man page 
(global-set-key (kbd "M-s M-s") 'helm-occur) ;; incremental search like c-s 

;;on the fly spell checker
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "90af7d0da6b97c28098177271c1d9198234435a2d1874880ba36e5bdae9da113" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

;;(load-theme 'spolsky 1)


;;no back ground in terminal 
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)









