;; auto-complete
(require 'auto-complete-config)
(ac-config-default) 
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)
(setq ac-delay 0.1)
(setq ac-auto-show-menu 0.5)
(set-face-foreground 'popup-summary-face "black")
(set-face-background 'ac-selection-face "blue")
(set-face-background 'ac-completion-face "white")
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")

;; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/user_snippets"
	"~/.emacs.d/snippets"
	;; "~/.emacs.d/yasnippet/extras/imported"
	))
(yas-global-mode 1)
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))

;; smartchr
(require 'smartchr)
;; (global-set-key (kbd "=")  (smartchr '(" = " " == " "=")))
(global-set-key (kbd "(")  (smartchr '("(`!!')" "(")))
(global-set-key (kbd "{")  (smartchr '("{`!!'}" "{")))
(global-set-key (kbd "[")  (smartchr '("[`!!']" "[")))
(global-set-key (kbd "'")  (smartchr '("'`!!''" "'")))
;; (global-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"")))

;; recentf
(when (require 'recentf nil t)
  (setq recentf-max-saved-items 20000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer
	(run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  (require 'recentf-ext))

;; 同名バッファを判別しやすくする。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; color-moccur
(require 'color-moccur)

;; auto-highlight-symbol
(require 'auto-highlight-symbol)
(auto-highlight-symbol-mode t)
