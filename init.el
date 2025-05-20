(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(css-indent-offset 2)
 '(font-lock-global-modes '(not speedbar-mode))
 '(indent-tabs-mode nil)
 '(package-selected-packages
   '(treesit-auto sqlup-mode exec-path-from-shell string-inflection magit format-all markdown-mode company-quickhelp multi-vterm vterm sql-indent sqlformat blackboard-theme))
 '(treesit-font-lock-level 4))

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)

(defun load-rc-file (rc-filename)
  (load (expand-file-name (format "~/.emacs.d/rc/%s.el"
				  rc-filename))))

(setq tramp-default-method "ssh")

(use-package blackboard-theme :config (load-theme 'blackboard t))

(use-package magit)

(use-package company
  :hook (after-init . global-company-mode)
  :config (load-rc-file "rc-company"))

;; (use-package company-quickhelp :hook (company-mode . company-quickhelp-mode))

(use-package gptel
  :config
  (setq
   gptel-model 'qwen2.5:14b
   gptel-backend (gptel-make-ollama "Ollama"
                   :host "localhost:11434"
                   :stream t
                   :models '(qwen2.5:14b)))
  :bind (("C-<tab>" . gptel-menu)))

(use-package string-inflection
  :bind (("C-c i". string-inflection-all-cycle)))

(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell :config (exec-path-from-shell-initialize))
  (use-package vterm)
  (use-package multi-vterm
    ;; use multi-vterm for inferior shell process
    :config (load-rc-file "rc-multi-vterm"))
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
  :hook ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode rust-ts-mode python-ts-mode latex-mode c-ts-mode c++-ts-mode yaml-ts-mode) . eglot-ensure)
  :config
  ;;
  ;; Performance tweak. See https://www.gnu.org/software//emacs/manual/html_node/eglot/Performance.html
  (setq eglot-events-buffer-size 0))

(use-package eldoc-box
  :config
  (setq eldoc-box-max-pixel-height 400)
  (setq eldoc-box-only-multi-line t))

(add-hook 'eglot-managed-mode-hook 'eldoc-box-hover-mode t)

(use-package format-all
  :hook
  ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode rust-ts-mode python-ts-mode c-ts-mode c++-ts-mode yaml-ts-mode) . format-all-ensure-formatter)
  ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode rust-ts-mode python-ts-mode c-ts-mode c++-ts-mode yaml-ts-mode) . format-all-mode))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package sly
  :config
  (setq sly-complete-symbol-function 'sly-simple-completions)
  (setq sly-lisp-implementations
        '((sbcl ("sbcl") :coding-system utf-8-unix)
          (qlot ("qlot" "exec" "sbcl") :coding-system utf-8-unix))))


;; add file extension to auto list
(add-to-list 'auto-mode-alist '("\\.tex\\'". latex-mode))

(add-hook 'text-mode-hook 'flyspell-mode)

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
