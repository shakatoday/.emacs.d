
;; setup roswell
;; by defvar, this setting won't be overwritten in ~/.roswell/helper.el
(defvar roswell-slime-contribs '(slime-fancy
                                 slime-indentation
                                 slime-company))

(load (expand-file-name "~/.roswell/helper.el"))
(load (expand-file-name "~/quicklisp/clhs-use-local.el") t)

(defun slime-qlot-exec (directory)
  (interactive (list (read-directory-name "Project directory: ")))
  (slime-start :program "qlot"
               :program-args '("exec" "ros" "-S" "." "run")
               :directory directory
               :name 'qlot
               :env (list (concat "PATH=" (mapconcat 'identity exec-path ":")))))
