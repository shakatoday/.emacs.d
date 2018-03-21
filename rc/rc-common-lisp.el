;; setup ac-slime
(add-hook 'slime-mode-hook 'set-up-slime-ac)
(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;;setup roswell
;; by defvar, this setting won't be overwritten in ~/.roswell/helper.el
(defvar roswell-slime-contribs '(slime-fancy
				 slime-repl-ansi-color)) ; remember at least to create a symbolic link to slime/contrib 

(setq slime-contribs roswell-slime-contribs)
(load (expand-file-name "~/.roswell/helper.el"))


