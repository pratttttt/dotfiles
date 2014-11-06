;; Load Files
(load "~/dotfiles/ui.el")
(load "~/dotfiles/c++.el")
(load "~/dotfiles/org-clojure.el")
(load "~/dotfiles/org-mode.el")

;; Org Mode modifications
;; fontify code in code blocks
(setq org-src-fontify-natively t)

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

;; Go Evil
(defun go-evil() (require 'evil) (evil-mode 1)

  (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
  (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

  ;; Evil Keymaps
  (define-key evil-normal-state-map "h" 'evil-next-line)
  (define-key evil-normal-state-map "t" 'evil-previous-line)
  (define-key evil-normal-state-map "n" 'evil-forward-char)
  (define-key evil-normal-state-map "s" 'evil-backward-char)

  (define-key evil-normal-state-map "N" 'other-window)
  (define-key evil-motion-state-map "N" 'other-window)

  (define-key evil-visual-state-map "h" 'evil-next-line)
  (define-key evil-visual-state-map "t" 'evil-previous-line)
  (define-key evil-visual-state-map "n" 'evil-forward-char)
  (define-key evil-visual-state-map "s" 'evil-backward-char)

  (define-key evil-motion-state-map "h" 'evil-next-line)
  (define-key evil-motion-state-map "t" 'evil-previous-line)
  (define-key evil-motion-state-map "n" 'evil-forward-char)
  (define-key evil-motion-state-map "s" 'evil-backward-char)

  (define-key evil-normal-state-map "j" 'evil-delete)
  (define-key evil-visual-state-map "j" 'evil-delete)
  (define-key evil-motion-state-map "j" 'evil-delete)

  (define-key evil-normal-state-map "l" 'evil-search-next)
  (define-key evil-normal-state-map "L" 'evil-search-previous)

  (define-key evil-normal-state-map "H" 'evil-forward-paragraph)
  (define-key evil-normal-state-map "T" 'evil-backward-paragraph)

  (define-key evil-visual-state-map "H" 'evil-forward-paragraph)
  (define-key evil-visual-state-map "T" 'evil-backward-paragraph)

  ;; Speedbar Evil Bindings
  (evil-declare-key 'motion speedbar-key-map
    "h" 'speedbar-next
    "t" 'speedbar-prev
    "n" 'forward-char
    "s" 'backward-char
    "H" 'forward-paragraph
    "T" 'backward-paragraph
    "i" 'speedbar-item-info
    "r" 'speedbar-refresh
    "u" 'speedbar-up-directory
    "o" 'speedbar-toggle-line-expansion
    (kbd "RET") 'speedbar-edit-line)
  )

(add-hook 'emacs-startup-hook 'go-evil)

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
(global-set-key (kbd "s-o") 'find-file)
(global-set-key (kbd "s-n") 'next-buffer)
(global-set-key (kbd "s-h") 'previous-buffer)

;;Open dotemacs in lisp mode
(add-to-list 'auto-mode-alist '("\\emacs\\'" . lisp-mode))

;; Window modifications
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-l") 'sr-speedbar-toggle)

;; Turn on InteractivelyDoThings
(require 'ido)
(ido-mode t)

;; Turn on autocomplete
(add-hook 'after-init-hook (lambda () (global-auto-complete-mode t)))

;; Emacs Frame title
(setq frame-title-format
      '("%S" (buffer-file-name "%f"
                               (dired-directory dired-directory "%b"))))

;; Get path from shell
(add-hook 'after-init-hook (lambda() 
                             (exec-path-from-shell-initialize)))


;;(custom-set-faces
;; custom-set-faces was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(helm-selection ((t (:background "#b5ffd1"))))
;; '(helm-source-header ((t (:background "#fff" :foreground "black" :weight bold :height 4 :family "Helvetica")))))
;; (custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
;; '(custom-safe-themes (quote ("cea6d15a8333e0c78e1e15a0524000de69aac2afa7bb6cf9d043a2627327844e" default)))

;;'(org-agenda-files (quote ("~/Dropbox/ncl-stage-3/Log.org" "~/Dropbox/ncl-stage-3/README.org")))
;;'(quack-fontify-style nil)
;;'(quack-remap-find-file-bindings-p nil))


(add-hook 'after-init-hook (lambda ()
                             (smartparens-global-mode 1)
                             (define-key sp-keymap (kbd "s-<left>") 'sp-backward-slurp-sexp)
                             (define-key sp-keymap (kbd "s-<right>") 'sp-forward-slurp-sexp)
                             (define-key sp-keymap (kbd "s-M-<left>") 'sp-forward-barf-sexp)
                             (define-key sp-keymap (kbd "s-M-<right>") 'sp-forward-barf-sexp)
                             (require 'smartparens-config)))


(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'org-mode-hook 'turn-on-auto-fill)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/Dropbox/ncl-stage-3/Log.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
