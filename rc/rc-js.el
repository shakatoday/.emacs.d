(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
(add-hook 'js2-mode-hook (lambda ()
                           (flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)))
