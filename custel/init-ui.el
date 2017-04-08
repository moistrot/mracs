(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -99)
;; 关闭启动画面
(setq inhibit-splash-screen 1)
(setq-default cursor-type 'bar)
(setq inital-frame-alist (quote ((fullscreen . maximized))))

;; dracula theme
(load-theme 'dracula 1)


(require 'airline-themes)
(load-theme 'airline-light t)

(provide 'init-ui)
