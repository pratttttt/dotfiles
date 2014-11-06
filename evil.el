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
