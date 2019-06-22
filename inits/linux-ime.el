;; mozc
(require 'mozc)
(setq default-input-method "japanese-mozc")
(setq mozc-candidate-style 'echo-area)

;; (setq interprogram-paste-function
;;       (lambda ()
;; 	(shell-command-to-string "xsel -b -o")))

;; (setq interprogram-cut-function
;;       (lambda (text &optional rest)
;; 	(let* ((process-connection-type nil)
;; 	       (proc (start-process "xsel" "*Messages*" "xsel" "-b" "-i")))
;; 	  (process-send-string proc text)
;; 	  (process-send-eof proc))))

(require 'xclip)
(xclip-mode 1)
