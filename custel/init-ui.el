;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)
;;(menu-bar-mode -99)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(global-linum-mode 1)


;; 关闭启动画面
(setq inhibit-splash-screen 1)
(setq-default cursor-type 'bar)
;;(setq inital-frame-alist (quote ((fullscreen . maximized))))

;; dracula theme
(load-theme 'dracula 1)


(require 'airline-themes)
(load-theme 'airline-light t)

(if (equal system-type 'darwin)
    (progn
      (set-face-attribute 'default nil :height 160)
      ))

(provide 'init-ui)
