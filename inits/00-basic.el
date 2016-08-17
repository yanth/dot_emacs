;;; 標準機能のもの

;; utf-8 をデフォルトに
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; バックアップを作らない
(setq backup-inhibited t)
(setq delete-auto-save-files t)

(setq ring-bell-function 'ignore)   ;; beep消す
(setq inhibit-startup-message t)    ;; 起動時の画面を表示しない
(setq x-select-enable-clipboard t)  ;; Xのクリップボードを利用する
(defalias 'yes-or-no-p 'y-or-n-p)   ;; yes-or-no-p
(setq indent-tabs-mode nil)         ;; タブ文字でなく、スペース利用
(show-paren-mode 1)		    ;; 対応するカッコを光らせる
(global-auto-revert-mode 1)	    ;; バッファ自動読み込み
(setq completion-ignore-case t)	    ;; ファイル名保管で大文字小文字を区別しない

;; 外見
(tool-bar-mode 0)
(menu-bar-mode 0)
;; (set-scroll-bar-mode nil)

;;; うこいてないと点滅が激しくなる
(set-cursor-color "orange")
(setq blink-cursor-interval 0.2)
(setq blink-cursor-delay 1.0)
(blink-cursor-mode 1)

;; 画像ファイルを表示
(auto-image-file-mode t)

;; kill-lineに改行を含む
(setq kill-whole-line t)

;; exec-path-from-shell
(exec-path-from-shell-initialize)

;; eshell 日本語
(setenv "LANG" "ja_JP.UTF-8")
