;; company-mode
(require 'company)
(global-company-mode) ; 全バッファで有効にする 
(setq company-idle-delay 0) ; デフォルトは0.5
(setq company-minimum-prefix-length 2) ; デフォルトは4
(setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)
(define-key company-active-map (kbd "C-h") nil)

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

;; highlight-symbol
(require 'highlight-symbol)
(setq highlight-symbol-idle-delay 1.0)
(add-hook 'go-mode-hook 'highlight-symbol-mode)
(add-hook 'go-mode-hook 'highlight-symbol-nav-mode)

;; auto-save-buffers-enhanced
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

; タグジャンプ設定
(add-hook 'helm-gtags-mode-hook
      '(lambda ()
         ;;入力されたタグの定義元へジャンプ
         (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
         ;;入力タグを参照する場所へジャンプ
         (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
         ;;入力したシンボルを参照する場所へジャンプ
         (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
         ;;タグ一覧からタグを選択し, その定義元にジャンプする
         (local-set-key (kbd "M-l") 'helm-gtags-select)
         ;;ジャンプ前の場所に戻る
         (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))
(add-hook 'php-mode-hook 'helm-gtags-mode)
