
(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)

  (setq company-transformers '(company-sort-by-backend-importance))
  (set (make-local-variable 'company-backends)
       '((company-tide company-files :with company-yasnippet :with company-dabbrev-code)
         (company-dabbrev-code company-dabbrev)))

  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(defun tide-copy-quickinfo ()
  (interactive)
  (kill-new (getf (getf (tide-send-command-sync "quickinfo"
                                                `(:file ,(tide-buffer-file-name) :line ,(tide-line-number-at-pos) :offset ,(tide-current-offset)))
                        :body)
                  :displayString)
            ))

(defun tsserver-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (tsserver
          (and root
               (expand-file-name "node_modules/.bin/tsserver"
                                 root))))
    (when (and tsserver (file-executable-p tsserver))
      (setq-default tide-tsserver-executable tsserver))))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

