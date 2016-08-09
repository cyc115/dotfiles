;;; Commentary: 
;;; init script -- this is the init script 
(require 'package)

;;disable ugly menu bar ontop
(tool-bar-mode -1)


;;no tabs (even though they are great)
(setq-default indent-tabs-mode nil)

;;add an ugly ruler at the top of buffer
(add-hook 'window-configuration-change-hook (lambda () (ruler-mode 1)))

;;auto refresh when disk file changed
(global-auto-revert-mode t)

(defun connect-c421 ()
  (interactive)
  (dired "/ssh:cs421g17@comp421.cs.mcgill.ca:/"))

;;===============
;;genereal set up 
;;===============

;;git integration
(require 'git)

;;allow open recent files 
(require 'recentf)
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files)

;;add MELPA to repo list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
;;init package.el
(package-initialize)

(require 'flycheck)

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

;;auto hilight current symbol
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)


;; better window navigation: enables C-x arrow key to change focused window 
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <left>") 'windmove-left)
(global-set-key (kbd "C-x <right>") 'windmove-right)

;;somehow my i search forward and toggle input method keybinding is swapped... switch it back

(global-set-key (kbd "C-s") 'isearch-forward)
(global-set-key (kbd "C-\\") 'toggle-input-method )  
;;(global-set-key (kbd "C-x C-/") 'toggle-)



;;================================
;;cedet ide mode for C development
;;================================
(global-ede-mode 1)

;;smooth scrolling
(require 'smooth-scrolling)

;;on the fly spell checker
(add-hook 'after-init-hook #'global-flycheck-mode)


;;============================
;;tuareg mode for caml editing
;;============================
(require 'tuareg)

 (add-to-list 'auto-mode-alist '("\\.inc\\'" . php-mode))

;;=====================================
;; auto enable anacoda for python dev
;;https://github.com/proofit404/anaconda-mode
;;=====================================

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;;allow c-c c-c to send python code to evaluate 
(defun shell-compile ()
      (interactive)
      (shell-command (concat "python " (buffer-file-name)))
      (if (<= (* 2 (window-height)) (frame-height))
          (enlarge-window 20)
        (/ (frame-height) 2)))
    (add-hook 'python-mode-hook
              '(lambda ()
                 (define-key (kbd "C-c C-c") 'shell-compile python-mode-map)))


;;;;;;;;;;
;; Helm ;;
;;;;;;;;;;


;;Helm is incremental completion and selection narrowing framework for Emacs.
;;It will help steer you in the right direction when you're looking for stuff in
;;Emacs (like buffers, files, etc).

(require 'helm-config)
(helm-mode 1)

(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "M-s M-f") 'helm-imenu) ;; show method sigitures
(global-set-key (kbd "M-s M-m") 'helm-man-woman) ;; quick display man page 
(global-set-key (kbd "M-s M-s") 'helm-occur) ;; incremental search like c-s 


;;==========================================================
;;dark theme that does not look completely shit in terminal!
;;==========================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spolsky)))
 '(custom-safe-themes (quote ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" "e26780280b5248eb9b2d02a237d9941956fc94972443b0f7aeec12b5c15db9f3" "90af7d0da6b97c28098177271c1d9198234435a2d1874880ba36e5bdae9da113" "90b5269aefee2c5f4029a6a039fb53803725af6f5c96036dee5dc029ff4dff60" "0ebe0307942b6e159ab794f90a074935a18c3c688b526a2035d14db1214cf69c" "a774c5551bc56d7a9c362dca4d73a374582caedb110c201a09b410c0ebbb5e70" default)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

;;no back ground in terminal 
(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (set-face-background 'default "unspecified-bg" (selected-frame))))

(add-hook 'window-setup-hook 'on-after-init)


;;======================================
;;tide mode for typescript ide functions
;;======================================

;; sample config
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode +1)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode +1)
            ;; company is an optional dependency. You have to
            ;; install it separately via package-install
            (company-mode-on)))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; Tide can be used along with web-mode to edit tsx files
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-setup)
              (flycheck-mode +1)
              (setq flycheck-check-syntax-automatically '(save mode-enabled))
              (eldoc-mode +1)
              (company-mode-on))))


(setenv "GOPATH" "/home/yuechuan/Github/FirefighterTracking/prototype/server:/home/yuechuan/Github/FirefighterTracking/prototype/videoserver")


;;;;;;;;;;;;
;useful func
;;;;;;;;;;;;

;;source: http://steve.yegge.googlepages.com/my-dot-emacs-file
(defun rename-file-and-buffer (rename-file-file-and-buffer)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
	(filename (buffer-file-name)))
    (if (not filename)
	(message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
	  (message "A buffer named '%s' already exists!" new-name)
	(progn
	  (rename-file name new-name 1)
	  (rename-buffer new-name)
	  (set-visited-file-name new-name)
	            (set-buffer-modified-p nil))))))
