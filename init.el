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
   '(treesit-auto tabnine sqlup-mode exec-path-from-shell string-inflection magit format-all markdown-mode slime-company company-quickhelp company-tabnine multi-vterm vterm sql-indent sqlformat blackboard-theme))
 '(treesit-font-lock-level 4))

(defun load-rc-file (rc-filename)
  (load (expand-file-name (format "~/.emacs.d/rc/%s.el"
				  rc-filename))))

(setq tramp-default-method "ssh")

(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package blackboard-theme :config (load-theme 'blackboard t))

(use-package magit)

(use-package company
  :hook (after-init . global-company-mode)
  :config (load-rc-file "rc-company"))

(use-package tabnine
  :hook ((text-mode prog-mode) . tabnine-mode)
  :hook (tabnine-mode . (lambda ()
                          ;;
                          ;; don't know why :bind (:map tabnine-completion-map) doesn't work.
                          ;; Here's a temporary workaround
                          (let ((keymap (make-sparse-keymap))
                                (keymap-higher (make-sparse-keymap)))
                            (define-key keymap (kbd "TAB") #'tabnine-accept-completion)
                            (define-key keymap (kbd "<tab>") #'tabnine-accept-completion)
                            (define-key keymap (kbd "C-g")  #'tabnine-clear-overlay)
                            (define-key keymap (kbd "M-f")  #'tabnine-accept-completion-by-word)
                            (define-key keymap (kbd "C-e")  #'tabnine-accept-completion-by-line)
                            (define-key keymap (kbd "M-[")  #'tabnine-previous-completion)
                            (define-key keymap (kbd "M-]")  #'tabnine-next-completion)
                            (define-key keymap-higher (kbd "C-<tab>") keymap)
                            (setq tabnine-completion-map keymap-higher))

                          ;;
                          ;; python-ts-mode bug workaround
                          ;; Error message: running timer ‘tabnine--post-command-debounce’: (wrong-type-argument sequencep editorconfig-set-indentation-python-mode)
                          (defun tabnine-util--infer-indentation-offset ()
                            "Infer indentation offset."
                            (or (let ((mode major-mode))
                                  (while (and (not (assq mode tabnine-util--indentation-alist))
                                              (setq mode (get mode 'derived-mode-parent))))
                                  (when mode
                                    (cl-some (lambda (s)
                                               (when (boundp s)
		                                 (symbol-value s)))
                                             (alist-get (if (eq mode 'python-ts-mode)
                                                            'python-mode
                                                          mode)
                                                        tabnine-util--indentation-alist))))
                                tab-width))))
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
  :ensure t
  :hook ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode rust-ts-mode python-ts-mode latex-mode c-ts-mode c++-ts-mode) . eglot-ensure)
  :config
  ;;
  ;; Performance tweak. See https://www.gnu.org/software//emacs/manual/html_node/eglot/Performance.html
  (setq eglot-events-buffer-size 0))

(use-package format-all
  :hook
  ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode rust-ts-mode python-ts-mode c-ts-mode c++-ts-mode) . format-all-ensure-formatter)
  ((tsx-ts-mode typescript-ts-mode html-mode css-ts-mode scss-mode json-ts-mode rust-ts-mode python-ts-mode c-ts-mode c++-ts-mode) . format-all-mode))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

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
