;; Load Files
(load "~/dotfiles/ui.el")
(load "~/dotfiles/c++.el")
(load "~/dotfiles/org-clojure.el")
(load "~/dotfiles/org-mode.el")
(load "~/dotfiles/evil.el")

;; Add Package Sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("melpa" . "http://melpa.milkbox.net/packages/")))

;; Scheme modifications
(setq geiser-racket-binary "/Applications/Racket\  v6.0.1/bin/racket")
(defun scheme-mode-quack-hook () (require 'quack))
(add-hook 'after-init-hook 'scheme-mode-quack-hook)
(global-set-key (kbd "s-r") 'run-racket)

;; Speedbar Modifications
(add-hook 'after-init-hook 'speedbar-config)
(defun speedbar-config()
(require 'sr-speedbar)
(setq speedbar-show-unknown-files t)
(speedbar-add-supported-extension ".rkt")
(setq sr-speedbar-max-width 70)
(setq sr-speedbar-auto-refresh t)
(setq sr-speedbar-right-side nil))

;; Helm Commands
(add-hook 'after-init-hook 'helm-hook)
(defun helm-hook()
(require 'helm-files)
(global-set-key (kbd "s-t") 'helm-for-files)
(setq helm-locate-command "mdfind -name %s %s"))

;; Quick edit dotemacs
(defun dot()
(interactive)
(find-file "~/dotfiles/.emacs"))
(global-set-key (kbd "s-.") 'dot)

;; Keyboard Shortcuts
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-n") 'next-buffer)
(global-set-key (kbd "s-h") 'previous-buffer)

;;;; Window shortcuts
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-l") 'sr-speedbar-toggle)

; Open emacs in Lisp Mode
(add-to-list 'auto-mode-alist '("\\emacs\\'" . lisp-mode))

;; Features

;;;; Autofill
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;;;; InteractivelyDoThings
(require 'ido)
(ido-mode t)

;;;; Autocomplete
(add-hook 'after-init-hook (lambda () (global-auto-complete-mode t)))

;;;; Smartparens
(add-hook 'after-init-hook (lambda ()
(smartparens-global-mode 1)
(define-key sp-keymap (kbd "s-<left>") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "s-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "s-M-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "s-M-<right>") 'sp-forward-barf-sexp)
(require 'smartparens-config)))

;;;; Flycheck
(add-hook 'after-init-hook 'global-flycheck-mode)

;; Emacs Frame title
  (setq frame-title-format
  '("%S" (buffer-file-name "%f"
  (dired-directory dired-directory "%b"))))

;; Get path from shell
  (add-hook 'after-init-hook (lambda() 
  (exec-path-from-shell-initialize)))


(custom-set-variables
'(org-agenda-files (quote ("~/Dropbox/ncl-stage-3/Log.org"))))

;; (custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(helm-selection ((t (:background "#b5ffd1"))))
;; '(helm-source-header ((t (:background "#fff" :foreground "black" :weight bold :height 4 :family "Helvetica")))))

