;; org-mode for .org files
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Bind C-c a to org agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;; Avoid Days Displayed in Column View
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; Keep notes in Dropbox
(setq org-default-notes-file "/Users/Prabros/Dropbox/notes.org")

;; Bind note taking to C-c n
(define-key global-map "\C-cn" 'org-capture)

;; Templates for capturing
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "/Users/Prabros/Dropbox/todos.org" "Tasks")
         "* TODO %?\n %i\n %a")
        ("j" "Notes" entry (file+datetree "/Users/Prabros/Dropbox/notes.org")
         "* %?\nEntered on %U\n %i\n %a")))


