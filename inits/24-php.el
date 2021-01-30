(require 'php-mode)

(add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back)))

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
