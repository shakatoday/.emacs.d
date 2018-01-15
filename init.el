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
 '(js-indent-level 4)
 '(package-selected-packages
   (quote
    (slime-company helm-descbinds blackboard-theme cherry-blossom-theme silkworm-theme popup slime magit company js2-mode monokai-theme zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(mapcar (lambda (init-filename)
	  (load (expand-file-name (format "~/.emacs.d/rc/%s.el"
					  init-filename))))
	'("rc-theme"
	  "rc-tramp"
	  "rc-company"
	  "rc-js"
	  "rc-common-lisp"
	  "rc-general-customization"))
(load (expand-file-name "~/.emacs.d/scriba/scriba.el"))

(slime)
