;; use multi-vterm for inferior shell process
(add-hook 'sh-mode-hook
          (lambda ()
            (defun sh-shell-process (force)
              "Get a shell process for interaction.
If FORCE is non-nil and no process found, create one."
              (if (process-live-p sh-shell-process)
                  sh-shell-process
                (setq sh-shell-process
                      (let ((found nil) proc
                            (procs (process-list)))
                        (while (and (not found) procs
                                    (process-live-p (setq proc (pop procs)))
                                    (process-command proc))
                          (when (string-equal "vterm" (process-name proc))
                            (setq found proc)))
                        (or found
                            (and force
                                 (get-buffer-process
                                  (let ((explicit-shell-file-name sh-shell-file)
                                        (display-buffer-overriding-action
                                         '(nil . ((inhibit-same-window . t)))))
                                    ;; We must prevent this `(shell)' call from
                                    ;; switching buffers, so that the variable
                                    ;; `sh-shell-process' is set locally in the
                                    ;; correct buffer.
                                    (save-current-buffer
                                      (multi-vterm))))))))))))
