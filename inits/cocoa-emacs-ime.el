;; mac config
;; (setq default-input-method "MacOSX")
;; (mac-set-input-method-parameter "com.google.inputmethod.Japanese.base" `title "あ")
;; (add-hook 'minibuffer-setup-hook 'mac-change-language-to-us)
;; (add-hook 'isearch-mode-hook 'mac-change-language-to-us)

;; (require 'mozc)
;; (setq default-input-method "japanese-mozc")
;; (setq mozc-candidate-style 'echo-area)

(defun copy-from-osx ()
(shell-command-to-string "pbpaste"))

(defun paste-to-osx (text &optional push)
 (let ((process-connection-type nil))
     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
       (process-send-string proc text)
       (process-send-eof proc))))

(setq interprogram-cut-function 'paste-to-osx)
(setq interprogram-paste-function 'copy-from-osx)
