(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(js-indent-level 2)
 '(package-selected-packages
   (quote
    (blackboard-theme cherry-blossom-theme silkworm-theme popup slime magit company js2-mode monokai-theme zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'blackboard t)
(exec-path-from-shell-initialize)

;; (ac-config-default)
;; (global-auto-complete-mode t)
;; (setq ac-modes (remove 'slime-repl-mode ac-modes))
;; ;;(setq ac-modes (remove 'js2-mode ac-modes))
;; (setq ac-auto-start 4)
;; (setq-default ac-sources '(ac-source-features ac-source-functions ac-source-yasnippet ac-source-variables ac-source-symbols ac-source-abbrev ac-source-dictionary ac-source-words-in-all-buffer ac-source-slime))
;; ;; (add-hook 'shell-mode-hook 'auto-complete-mode)

(add-hook 'after-init-hook 'global-company-mode)

(setq company-idle-delay 0.1)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(load (expand-file-name "~/.roswell/helper.el"))
;; (setq inferior-lisp-program "ros -Q run")
(setq inferior-lisp-program "ros -L sbcl -Q -l ~/.sbclrc run")
;;(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs
      '(slime-fancy
	slime-indentation
	slime-sbcl-exts
	slime-repl-ansi-color)) ; remember at least to create a symbolic link to slime/contrib 

(set-face-attribute 'default nil :height 140 :font "monofur")
