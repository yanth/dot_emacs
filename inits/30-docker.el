;; docker
(require 'docker)

;; dockerfile-mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))

;; docker-copose-mode
(require 'docker-compose-mode)

;; docker-tramp
;; コンテナ名でtrampアクセスできるようにする
(require 'docker-tramp-compat)
(set-variable 'docker-tramp-use-names t)
