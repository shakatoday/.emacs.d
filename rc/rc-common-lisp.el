(add-to-list 'auto-mode-alist '("\\.clp\\'" . html-mode))

;; setup ac-slime
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;;setup roswell
;; by defvar, this setting won't be overwritten in ~/.roswell/helper.el
(defvar roswell-slime-contribs '(slime-fancy
				 slime-indentation
				 slime-sbcl-exts
				 slime-repl-ansi-color ; remember at least to create a symbolic link to slime/contrib 
				 slime-tramp))

(setq slime-contribs roswell-slime-contribs)
(load (expand-file-name "~/.emacs.d/rc/rc-roswell.el"))
(require 'slime-autoloads)
(slime-setup slime-contribs)
(setq inferior-lisp-program "ros -Q run")
;;(setq inferior-lisp-program "/usr/local/bin/sbcl") ; for using native sbcl


