; 禁止备份文件
(setq auto-save-default nil)
(global-auto-revert-mode 1)
(setq make-backup-files nil)


;;(abbrev-mode t)
;;(define-abbrev-table 'global-abbrev-table '(
	;;				    ("xxlf" "liufei")
		;;			    ))

					; 全屏
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-hl-line-mode 1)
(global-linum-mode 1)

(fset 'yes-or-no-p 'y-or-n-p)  
(provide 'my-defalut)
