(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -99)
(global-linum-mode 1)
(setq inhibit-splash-screen 1)

(load-theme 'dracula 1)
(setq-default cursor-type 'bar)

;; orgmode 下源码高亮
(setq org-src-fontify-natively t)


(require 'airline-themes)
(load-theme 'airline-light t)

(provide 'init-ui)
