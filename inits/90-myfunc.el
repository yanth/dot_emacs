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
(setq dialy-dir-path "~/blog/_posts/")
(defun new-dialy ()
  (interactive)
  (create-today-markdown-file dialy-dir-path))

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
