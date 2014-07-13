; Add Package Sources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

; Set Geiser Racket Binary
(setq geiser-racket-binary "/Applications/Racket\  v6.0.1/bin/racket")

; No bars
(tool-bar-mode -1)

; Quick edit dotemacs
(defun dot ()
  (interactive)
  (find-file "~/.emacs"))
