;; post-twitter
;; require: exec-path-from-shell
;; require ruby-gem: tw
(defun my-post-twitter ()
  (interactive)
  (async-shell-command
   (concat "tw --yes "
	   (read-from-minibuffer "input tweet: "))))
(global-set-key (kbd "C-c t") 'my-post-twitter)

;; 自分用タイムスタンプ
(defun my-insert-date ()
  (interactive)
  (insert (concat
	   ;; "" (format-time-string "%Y-%m-%d %H:%M:%S"))))
	    "" (format-time-string "%Y-%m-%d"))))

;; markdownファイル作成
(defun create-today-markdown-file (dir-path)
  (switch-to-buffer (find-file-noselect 
		     (concat dir-path
			     (format-time-string "%Y-%m-%d")
     		     (number-to-string (- 1 (length (directory-files dir-path))))
			     ".md" ))))

;; 日記追加
;; (defun new-diary ()
;;   (interactive)
;;   (create-today-markdown-file diary-dir-path))

;; 今日の日記を開く
(setq diary-dir-path "~/Dropbox/text/blog/_posts/")
(defun today-diary()
  (interactive)
  (switch-to-buffer
   (find-file-noselect
    (concat diary-dir-path
	    (car (directory-files diary-dir-path  nil
				 (format-time-string "%Y-%m-%d")))))))
  
(defun file-name-base (&optional filename)
  "Return the base name of the FILENAME: no directory, no extension.
FILENAME defaults to `buffer-file-name'."
  (file-name-sans-extension
   (file-name-nondirectory (or filename (buffer-file-name)))))

(defun toggle-fullscreen ()
  "Toggle full screen"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))
