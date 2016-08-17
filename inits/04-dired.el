;;; initsフォルダのファイルに"_"を付ける関数
(defun dired-add-underscore-to-file-head ()
  "Add underscore to the head of file name, to exclude
loading init file in inits folder. But file name already
added underscore first, then remove it from file name."
  (interactive)
  (let ((files (dired-get-marked-files t current-prefix-arg))
        (prefix "_"))
    (mapcar (lambda (x)
              (cond
               ;;; filename prefix is already added.
               ((string-match (concat "^" prefix) x)
                ;;; replaced filename is already exists.
                (if (file-exists-p (substring x 1))
                    (error-message-string
                     (concat x " is already exists."))
                  (rename-file x (substring x (length prefix)))))
               ;;; renamed filename is exists. avoid confrict.
               ((file-exists-p (concat prefix x))
                (error-message-string
                 (concat x " is already exists.")))
               ;;; safe to add prefix.
               (t
                (rename-file x (concat prefix x)))
               ))
            files)
    (revert-buffer)))

;;; Diredでのショートカット
(add-hook 'dired-mode-hook
          (lambda ()
            (define-key dired-mode-map (kbd "_")
              'dired-add-underscore-to-file-head)))
