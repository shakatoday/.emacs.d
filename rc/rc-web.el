
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


;;; TSX
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))
            ;; enable typescript-tslint checker
            (flycheck-add-mode 'typescript-tslint 'web-mode)))


;;; JSX
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))
            ;; configure jsx-tide checker to run after your default jsx checker
            (flycheck-add-mode 'javascript-eslint 'web-mode)
            (flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)))
