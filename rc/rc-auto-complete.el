(ac-config-default)
(global-auto-complete-mode t)
(yas-global-mode)

(setq ac-modes (remove 'slime-repl-mode ac-modes))
(setq ac-modes (remove 'js2-mode ac-modes))
(setq ac-modes (remove 'python-mode ac-modes))
(setq ac-modes (remove 'typescript-mode ac-modes))
(setq ac-auto-start 4)
(setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-all-buffer))

(defun add-yasnippet-ac-sources ()
  (add-to-list 'ac-sources 'ac-source-yasnippet))

(defun add-slime-ac-sources ()
  (add-to-list 'ac-sources 'ac-source-slime))

(defun add-emacs-lisp-ac-sources ()
  (setq ac-sources
        (append ac-sources
                '(ac-source-features ac-source-functions ac-source-variables ac-source-symbols ac-source-yasnippet))))

(add-hook 'shell-mode-hook 'auto-complete-mode)
(add-hook 'slime-mode-hook 'add-slime-ac-sources)
(add-hook 'slime-mode-hook 'add-yasnippet-ac-sources)
(add-hook 'slime-repl-mode-hook 'add-slime-ac-sources)
(add-hook 'sql-mode-hook 'auto-complete-mode)
(add-hook 'sql-mode-hook 'add-yasnippet-ac-sources)
(add-hook 'emacs-lisp-mode 'add-emacs-lisp-ac-sources)

(setq web-mode-ac-sources-alist
  '(("css" . (ac-source-css-property))
    ("html" . (ac-source-words-in-buffer ac-source-abbrev))
    ("javascript" . (ac-source-words-in-buffer ac-source-abbrev))
    ("typescript" . (ac-source-words-in-buffer ac-source-abbrev))))
