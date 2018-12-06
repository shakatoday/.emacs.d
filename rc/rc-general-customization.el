(set-face-attribute 'default nil :height 140 :font "monofur")
(put 'downcase-region 'disabled nil)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
