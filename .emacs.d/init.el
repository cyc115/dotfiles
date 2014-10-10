(require 'package)
;;add MELPA to repo list

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;init package.el

(package-initialize)

;;auto complete
(require 'auto-complete)
;;default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

;;init yasnippet 
(require 'yasnippet)
(yas-global-mode 1)
(add-hook 'c-mode-hook
            (lambda ()
              (add-to-list 'ac-sources 'ac-source-c-headers)
             ;; (add-to-list 'ac-sources 'ac-source-c-header-symbols " /usr/include/x86_64-linux-gnu/c++/4.8" )
	      )
	    )

;;enable line number 
(global-linum-mode t)
;;enable auto pair auto indent
(electric-indent-mode 1)
(electric-pair-mode 1)
(electric-layout-mode 1)
;;correct indent to 4 space
(setq-default c-basic-offset 4)

;;set up cedet ide mode
(global-ede-mode 1)

;;smooth scrolling
(require 'smooth-scrolling)

(require 'tuareg)







