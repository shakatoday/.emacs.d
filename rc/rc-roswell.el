(defun roswell-configdir ()
  (substring (shell-command-to-string "ros roswell-internal-use version confdir") 0 -1))

(defun roswell-opt (var)
  (with-temp-buffer
    (insert-file-contents (concat (roswell-configdir) "config"))
    (goto-char (point-min))
    (re-search-forward (concat "^" var "\t[^\t]+\t\\(.*\\)$"))
    (match-string 1)))

(defun roswell-slime-directory ()
  (concat
   (roswell-configdir)
   "lisp/slime/"
   (roswell-opt "slime.version")
   "/"))

(defvar roswell-slime-contribs '(slime-fancy))


