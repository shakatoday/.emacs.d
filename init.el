(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")) ; use when needed
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-global-modes (quote (not speedbar-mode)))
 '(indent-tabs-mode nil)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(package-selected-packages
   (quote
    (web-mode yaml-mode elpy feature-mode ein ac-racer racer cargo rust-mode exec-path-from-shell markdown-mode ac-slime auto-complete blackboard-theme popup magit js2-mode)))
 '(rust-format-on-save t))

(mapcar (lambda (init-filename)
	  (load (expand-file-name (format "~/.emacs.d/rc/%s.el"
					  init-filename))))
	'("rc-theme"
	  "rc-tramp"
	  "rc-auto-complete"
	  "rc-js"
          "rc-web"
          "rc-common-lisp"
          "rc-rust"
          "rc-python"
          "rc-ein"
	  "rc-general-customization"))

(load (expand-file-name "~/.emacs.d/scriba/scriba.el"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
