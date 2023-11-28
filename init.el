(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (setf (alist-get "melpa" package-archives nil nil 'string=)
;;       "https://www.mirrorservice.org/sites/melpa.org/packages/") ;; use when necessary
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(font-lock-global-modes '(not speedbar-mode))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   '(tabnine sqlup-mode exec-path-from-shell string-inflection magit format-all markdown-mode slime-company company-quickhelp company-tabnine multi-vterm vterm sql-indent sqlformat blackboard-theme))
 '(treesit-font-lock-level 4))

(defun load-rc-file (rc-filename)
  (load (expand-file-name (format "~/.emacs.d/rc/%s.el"
				  rc-filename))))

(setq tramp-default-method "ssh")

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package blackboard-theme :config (load-theme 'blackboard t))

(defun insert-space-before-point (&optional n)
  (interactive "p")
  (save-excursion
    (insert-char ?\  n)))

(global-set-key (kbd "M-SPC") 'insert-space-before-point)

(use-package magit)

(use-package company
  :hook (after-init . global-company-mode)
  :config (load-rc-file "rc-company"))

(use-package tabnine
  :hook ((text-mode prog-mode) . tabnine-mode)
  ;;
  ;; don't know why :bind (:map tabnine-completion-map) doesn't work.
  ;; Here's a temporary workaround
  :hook (tabnine-mode . (lambda ()
                          (keymap-set tabnine-completion-map "C-<tab>" 'tabnine-accept-completion)
                          (keymap-unset tabnine-completion-map "<tab>" t)
                          (keymap-unset tabnine-completion-map "C-i" t)))
  :diminish "⌬"
  :custom
  (tabnine-wait 1)
  (tabnine-minimum-prefix-length 0)
  :hook (kill-emacs . tabnine-kill-process)
  :config
  (tabnine-start-process))

(use-package company-quickhelp :hook (company-mode . company-quickhelp-mode))

(use-package slime-company)
(load-rc-file "rc-common-lisp")

(use-package string-inflection
  :bind (("C-c i". string-inflection-all-cycle)))

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell :config (exec-path-from-shell-initialize))
  (use-package vterm)
  (use-package multi-vterm)
  (set-face-attribute 'default nil :height 180 :font "monofur"))

(use-package sqlformat
  :hook (sql-mode . sqlformat-on-save-mode)
  :config
  (setq sqlformat-command 'pgformatter)
  (setq sqlformat-args '("-s2" "-g" "-U0")))
(use-package sql-indent :hook (sql-mode . sqlind-minor-mode))
(use-package sqlup-mode :hook ((sql-mode sql-interactive-mode) . sqlup-mode))
(load-rc-file "rc-sql")

(use-package markdown-mode
  :bind (:map markdown-mode-map
         ("C-c C-e" . markdown-do))
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown"))

(use-package eglot
  :ensure t
  :hook ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode) . eglot-ensure)
  :config
  ;;
  ;; Performance tweak. See https://www.gnu.org/software//emacs/manual/html_node/eglot/Performance.html
  (setq eglot-events-buffer-size 0))

(use-package format-all
  :hook
  ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode) . format-all-ensure-formatter)
  ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode) . format-all-mode))

(add-hook 'text-mode-hook 'flyspell-mode)

;; tree-sitter
(setq treesit-extra-load-path '("/opt/local/lib/"))
(setq auto-mode-alist
      (append '(("\\.js\\'" . tsx-ts-mode)
                ("\\.jsx\\'" . tsx-ts-mode)
                ("\\.ts\\'" . typescript-ts-mode)
                ("\\.tsx\\'" . tsx-ts-mode)
                ("\\.json\\'" . json-ts-mode)
                ("\\.css\\'" . css-ts-mode))
              auto-mode-alist))

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq column-number-mode t)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
