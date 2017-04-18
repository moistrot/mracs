;;(tool-bar-mode -1)
;;(scroll-bar-mode -1)
(menu-bar-mode -99)

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

;;(setq solarized-scale-org-headlines nil)
;;(set-face-attribute 'default nil :font "consolas-12:weight=normal")
;;(setq face-font-rescale-alist (list (cons "SimSun" 1.2)))))

;;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
;; '(org-table ((t (:foreground "#6c71c4" :family "Ubuntu Mono")))))
;(set-default-font "Ubuntu Mono 12")
;(set-fontset-font "fontset-default" 'unicode"WenQuanYi Bitmap Song 12") ;;for linux

(custom-set-faces
  '(org-level-1 ((t (:inherit outline-1 :height 1.0))))
  '(org-level-2 ((t (:inherit outline-2 :height 1.0))))
  '(org-level-3 ((t (:inherit outline-3 :height 1.0))))
  '(org-level-4 ((t (:inherit outline-4 :height 1.0))))
  '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
)

(provide 'init-ui)
