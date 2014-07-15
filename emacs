;; Start up options
(load-theme 'adwaita t)
(setq inhibit-startup-message t)
(global-linum-mode t)
(set-face-attribute 'default nil :font  "Inconsolata-14")
(split-window-right) ;Start with two windows
(custom-set-variables
'(speedbar-show-unknown-files t))

;; Add Package Sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;; Scheme modifications
(setq geiser-racket-binary "/Applications/Racket\  v6.0.1/bin/racket")

(defun scheme-mode-quack-hook ()
(require 'quack))
(add-hook 'scheme-mode-hook 'scheme-mode-quack-hook)

;; Less chrome
(tool-bar-mode -1)

;; Quick edit dotemacs
(defun dot()
  (interactive)
  (find-file "~/dotfiles/emacs"))

;; Turn on InteractivelyDoThings
(require 'ido)
(ido-mode t)

;; Autocomplete
(add-hook 'after-init-hook 'autocomplete)

(defun autocomplete()
(global-auto-complete-mode 1)
)
