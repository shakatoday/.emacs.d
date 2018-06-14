;; setup ac-slime
(mapcar (lambda (mode-name)
          (add-hook mode-name
                    (lambda ()
                      (set-up-slime-ac)
                      (make-local-variable 'ac-ignore-case)
                      (setq ac-ignore-case nil))))
        '(slime-mode-hook slime-repl-mode-hook))
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'slime-repl-mode))

;;setup roswell
;; by defvar, this setting won't be overwritten in ~/.roswell/helper.el
(defvar roswell-slime-contribs '(slime-fancy
                                 slime-indentation
				 slime-repl-ansi-color)) ; remember at least to create a symbolic link to slime/contrib 

(setq slime-contribs roswell-slime-contribs)
(load (expand-file-name "~/.roswell/helper.el"))


