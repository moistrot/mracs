(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://elpa.emacs-china.org/melpa/") t)
(package-initialize) ;; You might already have this line
(require 'cl)

 ;; Add Packages
 (defvar moistrot-packages '(
                ;; --- Auto-completion ---
		popwin
                company
                ;; --- Better Editor ---
                swiper
                counsel
                smartparens
                ;; --- Major Mode ---
                ;; js2-mode
                ;; --- Minor Mode ---
                ;; nodejs-repl
                ;; exec-path-from-shell
                ;; --- Themes ---
                monokai-theme
                ;; solarized-theme
                ) "Default packages")

 (setq package-selected-packages moistrot-packages)

 (defun moistrot-packages-installed-p ()
     (loop for pkg in moistrot-packages
           when (not (package-installed-p pkg)) do (return nil)
           finally (return t)))

 (unless (moistrot-packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg moistrot-packages)
       (when (not (package-installed-p pkg))
         (package-install pkg))))


(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(global-set-key (kbd "<f2>") 'open-my-init-file)
(global-set-key (kbd "<f2>") 'open-my-init-file)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -99)
(global-linum-mode 1)
(setq inhibit-splash-screen 1)

(global-company-mode t)
(load-theme 'dracula 1)

(setq-default cursor-type 'bar)
					; 禁止备份文件
(setq auto-save-default nil)
(global-auto-revert-mode 1)
(setq make-backup-file nil)
(require 'org)
(setq org-src-fontify-natively t)
					; 全屏
(setq inital-frame-alist (quote ((fullscreen . maximized))))

(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
(global-hl-line-mode 1)

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

					; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "<f6>") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)

(require 'smartparens-config)


(global-set-key (kbd "C-w") 'backward-kill-word)
(evil-mode 1)
(global-evil-leader-mode)

(window-numbering-mode 1)
(which-key-mode 1)

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )


(require 'airline-themes)
(load-theme 'airline-light t)



;; remove all keybindings from insert-state keymap, use emacs-state when editing
(setcdr evil-insert-state-map nil)
;; ESC to switch back normal-state
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(require 'go-autocomplete)
(require 'auto-complete-config)
(ac-config-default)

(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")

(require 'auto-complete)
(global-auto-complete-mode t)
(define-key ac-complete-mode-map "\C-n" 'ac-next)
(define-key ac-complete-mode-map "\C-p" 'ac-previous)


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

(require 'popwin)
(popwin-mode  t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ac-auto-show-menu 0.3)
 '(company-idle-delay 0.3)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" default)))
 '(evil-leader/leader "SPC")
 '(which-key-idle-delay 0.4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
