;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\\.md" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.txt" . markdown-mode) auto-mode-alist))

;; using yasnippets in markdown mode.
(defun markdown-unset-tab ()
  "markdown-mode-hook"
  (define-key markdown-mode-map (kbd "<tab>") nil))
(add-hook 'markdown-mode-hook '(lambda() (markdown-unset-tab)))

;; howm
(require 'howm)
(setq howm-menu-lang 'ja)
(autoload 'howm-menu "howm" "Hitori Otegaru Wiki Modoki" t)

(setq howm-directory "~/Dropbox/text/howm/")
(setq howm-keyword-file "~/.emacs.d/.howm-keys")
(setq howm-history-file "~/.emacs.d/.howm-history")
(setq howm-process-coding-system 'utf-8)
(setq howm-remember-first-line-to-title t)
(setq howm-template "= %title\n%cursor\n%date\n")
