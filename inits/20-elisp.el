;;; initsフォルダのみ、保存時に自動コンパイルして即反映させる
(defun auto-save-byte-compile-file ()
  "Do `byte-compile-file' and reload setting immediately, When elisp file saved only in inits folder."
  (interactive)
  (when (or (equal default-directory inits_dir)
            (equal default-directory (abbreviate-file-name inits_dir)))
    (byte-compile-file buffer-file-name t)))

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (add-hook 'after-save-hook 'auto-save-byte-compile-file nil t)))

