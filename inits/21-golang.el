;; gocode
(require 'go-autocomplete)

;; godef-jump 
(add-hook 'go-mode-hook (lambda()
			  (local-set-key(kbd "M-.") 'godef-jump)))

;; gofmt
(add-hook 'before-save-hook 'gofmt-before-save)

;; godoc
(defvar my/helm-go-source
  '((name . "Helm Go")
    (candidates . go-packages)
	(action . (("Show document" . godoc)
		   ("Import package" . my/helm-go-import-add)))))

(defun my/helm-go-import-add (candidate)
  (dolist (package (helm-marked-candidates))
    (go-import-add current-prefix-arg package)))

(defun my/helm-go ()
   (interactive)
   (helm :sources '(my/helm-go-source) :buffer "*helm go*"))

(define-key go-mode-map (kbd "C-c C-d") 'my/helm-go)
