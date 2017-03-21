(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company slime magit monokai-theme auto-complete exec-path-from-shell zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'monokai t)
(exec-path-from-shell-initialize)

;; (ac-config-default)
;; (setq ac-auto-start 4)
;; (setq-default ac-sources '(ac-source-features ac-source-functions ac-source-yasnippet ac-source-variables ac-source-symbols ac-source-abbrev ac-source-dictionary ac-source-words-in-all-
;; (add-hook 'shell-mode-hook 'auto-complete-mode)

(add-hook 'after-init-hook 'global-company-mode)

(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs
      '(slime-fancy
	slime-indentation
	slime-repl-ansi-color)) ; remember at least to create a symbolic link to slime/contrib 
