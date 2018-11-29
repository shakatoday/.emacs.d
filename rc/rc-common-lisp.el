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

;; setup roswell
;; by defvar, this setting won't be overwritten in ~/.roswell/helper.el
(defvar roswell-slime-contribs '(slime-fancy
                                 slime-indentation))

(setq slime-contribs roswell-slime-contribs)
(load (expand-file-name "~/.roswell/helper.el"))

;; use local clhs
;; use quicklisp to install system clhs and do necessary setup for the first time usage
(load (expand-file-name "~/.roswell/lisp/quicklisp/clhs-use-local.el") t)
