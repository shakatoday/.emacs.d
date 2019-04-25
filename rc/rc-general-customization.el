(set-face-attribute 'default nil :height 140 :font "monofur")
(put 'downcase-region 'disabled nil)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t  ; Don't de-link hard links
      version-control        t  ; Use version numbers on backups
      delete-old-versions    t  ; Automatically delete excess backups:
      kept-new-versions      6 ; how many of the newest versions to keep
      kept-old-versions      2) ; and how many of the old
