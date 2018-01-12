(add-to-list 'auto-mode-alist '("\\.clp\\'" . html-mode))


;; by defvar, this setting won't be overwritten in ~/.roswell/helper.el
(defvar roswell-slime-contribs '(slime-fancy
				 slime-indentation
				 slime-sbcl-exts
				 slime-repl-ansi-color ; remember at least to create a symbolic link to slime/contrib 
				 slime-tramp))

(load (expand-file-name "~/.roswell/helper.el"))
(setq inferior-lisp-program "ros -Q run")
(setq slime-contribs roswell-slime-contribs)

;;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; for using native sbcl
