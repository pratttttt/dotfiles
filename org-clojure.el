(add-hook 'org-mode-hook (lambda () (add-to-list 'org-structure-template-alist '("clj" "#+begin_src clojure\n?\n#+end_src"))))

(add-to-list 'load-path "/Users/Prabros/elisp/org-mode/lisp")
(require 'ob-clojure)
(setq org-confirm-babel-evaluate nil)
(setq org-babel-clojure-backend 'cider)

