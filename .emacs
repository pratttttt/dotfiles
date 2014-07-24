;; Start up settings
(add-hook 'after-init-hook
          (lambda()

            ;; Set color scheme and typeface
            (load-theme 'twilight-bright t)
            (set-face-attribute 'default nil :font  "Inconsolata-14")

            ;; Frame Geometry
            (add-to-list 'initial-frame-alist '(width . 100))
            (add-to-list 'initial-frame-alist '(height . 45))
            (add-to-list 'initial-frame-alist '(left . 400))
            (add-to-list 'initial-frame-alist '(top . 100))

            ;; No splash screen
            (setq inhibit-startup-message t)

            ;; Turn on line numbers
            (global-linum-mode t)

            ;; Less chrome
            (tool-bar-mode -1)
            ))

;; Add Package Sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Scheme modifications
(setq geiser-racket-binary "/Applications/Racket\  v6.0.1/bin/racket")
(defun scheme-mode-quack-hook ()
  (require 'quack))
(add-hook 'after-init-hook 'scheme-mode-quack-hook)


;; Speedbar Modifications
(add-hook 'after-init-hook 'speedbar-config)
(defun speedbar-config()
  (require 'sr-speedbar)
  (setq speedbar-show-unknown-files t)
  (speedbar-add-supported-extension ".rkt")
  (setq sr-speedbar-right-side nil))

;; Go Evil
(defun go-evil()
  (require 'evil)
  (evil-mode 1)

  ;; Evil Keymaps
  (define-key evil-normal-state-map "h" 'evil-next-line)
  (define-key evil-normal-state-map "t" 'evil-previous-line)
  (define-key evil-normal-state-map "n" 'evil-forward-char)
  (define-key evil-normal-state-map "s" 'evil-backward-char)

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

;; Quick edit dotemacs
(defun dot()
  (interactive)
  (find-file "~/dotfiles/.emacs"))
(global-set-key (kbd "s-.") 'dot)

;;Open dotemacs in lisp mode
(add-to-list 'auto-mode-alist '("\\emacs\\'" . lisp-mode))

;; Window modifications
(global-set-key (kbd "s-1") 'delete-other-windows)
(global-set-key (kbd "s-b") 'sr-speedbar-toggle)

;; Turn on InteractivelyDoThings
(require 'ido)
(ido-mode t)

;; Turn on autocomplete
(add-hook 'after-init-hook (lambda () (global-auto-complete-mode t)))
