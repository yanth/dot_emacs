;; helm
(require 'helm-config)
(require 'helm-migemo)
(helm-descbinds-mode)
(setq helm-use-migemo t)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-for-files)
(global-set-key (kbd "C-x C-b") 'helm-for-files)
(global-set-key (kbd "C-x i") 'helm-imenu)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
