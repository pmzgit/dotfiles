(server-start)
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)

;; helm
(require 'helm-config)

;; Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; smartparens
(require 'smartparens-config)


;; window-numbering-mode
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'window-numbering)
(window-numbering-mode 1)

;; neotree
(add-hook 'neotree-mode-hook
            (lambda ()
              (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
              (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
              (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)))

;; Emacs 主题
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'color-theme)
(color-theme-initialize)
(color-theme-solarized-dark)

;; Evil 扩展
(add-to-list 'load-path "~/.emacs.d/lisp")
(require 'undo-tree)
(global-undo-tree-mode)
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/lisp/Evil")
(require 'evil)
(evil-mode 1)

;; js2-mode
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; markdown-mode
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-hook 'markdown-mode-hook '(lambda ()
                                 (local-set-key (kbd "RET") 'comment-indent-new-line)))

;全屏 
(defun my-fullscreen () 
  (interactive) 
  (x-send-client-message 
   nil 0 nil "_NET_WM_STATE" 32 
   '(2 "_NET_WM_STATE_FULLSCREEN" 0)) 
) 
;; 设置tab space
(setq tab-width 4)

;; 设置自动显示行号
(setq linum-format "%4d ") ;;设置行号显示格
(global-linum-mode t)

;; 设置默认换行模式为“在窗口边缘自动换行”
(toggle-truncate-lines t)

;; 高亮光标的当前行
(global-hl-line-mode 1)

(when (string-equal system-type "windows-nt")
   "在Windows环境中关闭菜单条"
(menu-bar-mode -1))
;; 关闭工具条
(tool-bar-mode -1)

;; 关闭滚动条
(scroll-bar-mode -1)

(global-font-lock-mode t);语法高亮 
(fset 'yes-or-no-p 'y-or-n-p);以 y/n代表 yes/no，可能你觉得不需要，呵呵。 
(display-time-mode 1);显示时间，格式如下 
(setq display-time-24hr-format t) 
(setq display-time-day-and-date t) 
;;关闭emacs启动时的画面 
(setq inhibit-startup-message t) 
(setq gnus-inhibit-startup-message t) 
;; 设定不产生备份文件 
(setq make-backup-files nil) 
;; 不生成临时文件 
(setq-default make-backup-files nil) 
;; 行注释
(defun my-comment-or-uncomment-region (beg end &optional arg)  
  (interactive (if (use-region-p)  
                   (list (region-beginning) (region-end) nil)  
                 (list (line-beginning-position)  
                       (line-beginning-position 2))))  
  (comment-or-uncomment-region beg end arg)  
)  
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)
;; 行注释快捷键
(global-set-key [?\C-c ?\C-/] 'comment-or-uncomment-region)


