(ac-config-default)
(global-auto-complete-mode t)
(setq ac-modes (remove 'slime-repl-mode ac-modes))
(setq ac-modes (remove 'js2-mode ac-modes))
(setq ac-modes (remove 'python-mode ac-modes))
(setq ac-auto-start 4)
(setq-default ac-sources '(ac-source-features ac-source-functions ac-source-yasnippet ac-source-variables ac-source-symbols ac-source-abbrev ac-source-dictionary ac-source-words-in-all-buffer ac-source-slime))
(add-hook 'shell-mode-hook 'auto-complete-mode)

