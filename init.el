(add-to-list 'load-path (expand-file-name "~/.emacs.d/elisp/howm/"))

;; cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; init-loader
(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(setq inits_dir (expand-file-name "~/.emacs.d/inits/"))
(init-loader-load inits_dir)

(menu-bar-mode 0)
