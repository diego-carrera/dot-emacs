;bindings
(global-set-key (kbd "<f1>") 'start-kbd-macro)
(global-set-key (kbd "<f2>") 'end-kbd-macro)
(global-set-key (kbd "<f3>") 'call-last-kbd-macro)
(global-set-key (kbd "<f4>") 'indent-region)
(global-set-key (kbd "<f5>") 'enlarge-window)
(global-set-key (kbd "<f6>") 'shrink-window)
(global-set-key (kbd "<f7>") 'enlarge-window-horizontally)
(global-set-key (kbd "<f7>") 'shrink-window-horizontally)
(global-set-key (kbd "<f9>") 'comment-region)
(global-set-key (kbd "<f10>") 'uncomment-region)
(global-set-key (kbd "<f11>") 'replace-string)
(global-set-key (kbd "<f12>") 'kill-buffer)
(global-set-key (kbd "<S-f1>") 'goto-line)
(global-set-key (kbd "<S-f2>") 'hs-toggle-hiding)
(global-set-key (kbd "<S-f3>") 'ispell-buffer)
(global-set-key (kbd "<S-f4>") 'ispell-region)
;; ;;completar codigo con C-TAB
(global-set-key (kbd "<backtab>") 'dabbrev-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
;;MOVE ALT-ARROW
(windmove-default-keybindings 'meta)


;;DEFAULTS
(setq visible-bell 1)
(global-font-lock-mode 1)
(global-linum-mode 1)
(menu-bar-mode nil)
(tool-bar-mode nil)
(show-paren-mode 1)
(setq show-paren-delay 0)
(transient-mark-mode 1)
(fset 'yes-or-no-p 'y-or-n-p)
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(setq icon-title-format "Emacs - %b" )
(setq inhibit-startup-message 1)
(setq mouse-yank-at-point 1)
(setq css-indent-offset 2)
(setq js-indent-level 2)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;;
(setq-default c-basic-offset 2
							tab-width 2
							indent-tabs-mode nil)

(c-set-offset 'arglist-intro 2)
(c-set-offset 'arglist-close 0)


;; Turn off the annoying default backup behaviour
(if (file-directory-p "~/.emacs.d/backup")
    (setq backup-directory-alist '(("." . "~/.emacs.d/backup")))
    (message "Directory does not exist: ~/.emacs.d/backup"))

;;elpa
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))


;;el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (end-of-buffer)
    (eval-print-last-sexp)))
(el-get 'sync)

(require 'color-theme)
(require 'color-theme-wombat)
(require 'php-mode)
(require 'uniquify)
(require 'yasnippet-bundle)
;;hooks
;;css
(add-hook 'css-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-delimiters-mode)
(add-hook 'css-mode-hook 'hs-minor-mode)
;;php
(add-hook 'php-mode-hook (lambda()
                           (hs-minor-mode 1)
                           (rainbow-delimiters-mode 1)
                           ))
;;javascript
(add-hook 'javascript-mode-hook (lambda()
                                  (hs-minor-mode 1)
                                  (rainbow-delimiters-mode 1)
                                  ))


(if window-system
    (color-theme-solarized-light))
