(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.1)
(setq company-dabbrev-downcase nil)
(setq company-backends '((company-capf :with company-yasnippet :with company-dabbrev-code)))
(setq company-tooltip-align-annotations t)
