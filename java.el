;; Java modifications

 (add-hook 'after-init-hook (lambda ()
 (require 'cedet)
 (require 'semantic)
 (load "semantic/loaddefs.el")
 (semantic-mode 1);;
 (require 'malabar-mode)
 (add-to-list 'auto-mode-alist '("\\.java\\'" . malabar-mode))))

