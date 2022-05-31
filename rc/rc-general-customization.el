;; dvorak keyboard
(global-set-key (kbd "C-x C-h") help-map)
(global-set-key (kbd "C-h") 'previous-line)

(global-set-key (kbd "C-c i") 'string-inflection-toggle)
(set-face-attribute 'default nil :height 180 :font "monofur")
(put 'downcase-region 'disabled nil)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq column-number-mode t)
