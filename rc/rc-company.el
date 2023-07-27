(add-hook 'after-init-hook 'global-company-mode)

;; Supress "Warning: default bindings are being changed to C-n and C-p"
(defadvice message (around my-message-filter activate)
  (unless (string-prefix-p "Warning: default bindings are being changed to C-n and C-p"
                           (or (ad-get-arg 0) ""))
    ad-do-it))

(setq company-idle-delay 0.1)
(setq company-dabbrev-downcase nil)
(setq company-backends '(company-tabnine
                         (company-capf :with company-yasnippet :with company-dabbrev-code)))
(setq company-tooltip-align-annotations t)
(setq company-show-numbers t)
(global-set-key (kbd "C-c C-/") #'company-other-backend)
(require 'company-tabnine)
