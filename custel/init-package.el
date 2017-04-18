(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
(require 'cl)

;; Add Packages
(defvar mracs-packages '(
		;; --- Auto-completion ---
                ;;company
		;;ac-complete
                ;; --- Better Editor ---
		avy
		ace-pinyin
                swiper
                counsel
                smartparens
		window-numbering
		;; require ag
		;; helm
		helm-ag
		expand-region
		;; theme
                dracula-theme
	        chinese-fonts-setup
		;; evil
		evil
		evil-leader
		;;
		yasnippet
		which-key
		popwin
		;; json
		json-reformat
		json-mode
		undo-tree
		;;
		;; go -lang
                go-autocomplete
                exec-path-from-shell
		;; require shell: go get -u github.com/nsf/gocode
		;; ocode set propose-builtins true
                ) "Default packages")




 (setq package-selected-packages mracs-packages)

 (defun mracs-packages-installed-p ()
     (loop for pkg in mracs-packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (mracs-packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg mracs-packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))

(global-company-mode t)

;; evil mode
(evil-mode 1)
(global-evil-leader-mode)
;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)
;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)


(window-numbering-mode 1)
;;(which-key-mode 1)
;; (require 'smartparens-config)

;; ivy mode
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)

;; popwin
(require 'popwin)
(popwin-mode  t)


;; dired mode
(require 'dired-x)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)

(put 'dired-find-alternate-file 'disabled nil)
;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
;; 延迟加载
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")


;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)

;; helm ag
(global-set-key (kbd "C-c p s") 'helm-do-ag-project-root)
(global-set-key (kbd "C-c p p") 'helm-ag)

;; expand-region
(require 'expand-region)
(require 'json-mode)
(require 'ace-pinyin)
(ace-pinyin-global-mode +1)

;;(require 'chinese-fonts-setup)
;; 让 chinese-fonts-setup 随着 emacs 自动生效。
;; (chinese-fonts-setup-enable)
;; 让 spacemacs mode-line 中的 Unicode 图标正确显示。
;; (cfs-set-spacemacs-fallback-fonts)

(provide 'init-package)
