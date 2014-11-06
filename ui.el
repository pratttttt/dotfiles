(defun theme-and-typeface()
  ;; Set color scheme and typeface
  (load-theme 'base16-railscasts t)
  (set-face-attribute 'default nil :font "Input Mono Condensed-14:Medium")
  (set-frame-font "Input Mono Condensed-14:Medium" nil t)

  (set-face-background 'fringe "#272935")

  ;; Make modeline flat
  (set-face-attribute 'mode-line nil :box nil)
  (set-face-attribute 'mode-line-inactive nil :box nil)
 )


(defun window-modifications()


  ;; Frame Geometry
  (add-to-list 'initial-frame-alist '(width . 100))
  (add-to-list 'initial-frame-alist '(height . 45))
  (add-to-list 'initial-frame-alist '(left . 400))
  (add-to-list 'initial-frame-alist '(top . 100))

  ;; Turn on line numbers
  (global-linum-mode t)
  (setq linum-format "%4d ")

  ;; No splash screen
  (setq inhibit-startup-message t)

  ;; Less chrome
  ;(tool-bar-mode -1)
  
;; Fringe color


)


;; Color Identifiers Mode on by default
(add-hook 'after-init-hook 'global-color-identifiers-mode)
(add-hook 'after-init-hook 'theme-and-typeface)
(add-hook 'after-init-hook 'window-modifications)


