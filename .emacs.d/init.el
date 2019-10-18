
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))
(add-to-list 'load-path "~/.emacs.d/lisp/")

(line-number-mode t)
(column-number-mode t)
(menu-bar-mode 0)

(defun replace-japanese-punctuation-marks ()
  "Replace \"、\" and \"。\" by and \"，\" and \"．\" respectively."
  (interactive)
  (let ((curpos (point)))
    (goto-char (point-min))
    (while (search-forward "。" nil t) (replace-match "．"))
    
    (goto-char (point-min))
    (while (search-forward "、" nil t) (replace-match "，"))
    (goto-char curpos)))

(add-hook 'tex-mode-hook
   '(lambda ()
       (add-hook 'before-save-hook 'replace-japanese-punctuation-marks nil 'make-it-local)))
(add-hook 'satysfi-mode-hook
   '(lambda ()
       (add-hook 'before-save-hook 'replace-japanese-punctuation-marks nil 'make-it-local)))

;; EL-Get
(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; company-mode
(el-get-bundle company)
(global-company-mode)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 2)
(setq company-selection-wrap-around t)
(setq company-dabbrev-downcase nil)
(define-key company-active-map (kbd "M-n") nil)
(define-key company-active-map (kbd "M-p") nil)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; Flycheck
(el-get-bundle flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; NeoTree
(el-get-bundle neotree)
(add-to-list 'load-path "el-get/neotree")
(global-set-key "\C-t" 'neotree-toggle)
(setq neo-show-hidden-files t)

;; Markdown
;; markdown-mode
(el-get-bundle markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

;; OCaml
;; tuareg-mode
(load "~/.opam/default/share/emacs/site-lisp/tuareg-site-file")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code." t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger." t)

;; Haskell
;; haskell-mode
(el-get-bundle haskell-mode)
(autoload 'haskell-mode "haskell-mode" nil t)
(autoload 'haskell-cabal "haskell-cabal" nil t)
(add-to-list 'auto-mode-alist '("\\.hs$" . haskell-mode))
(add-to-list 'auto-mode-alist '("\\.lhs$" . literate-haskell-mode))
(add-to-list 'auto-mode-alist '("\\.cabal$" . haskell-cabal-mode))
;; ghc-mod
(autoload 'ghc-init "ghc" nil t)
(autoload 'ghc-debug "ghc" nil t)
;; company-ghc
(el-get-bundle company-ghc)
(add-to-list 'company-backends 'company-ghc)


;; SATySFi
;; (add-to-list 'load-path (locate-user-emacs-file "satysfi.el"))
;; (require 'satysfi)
;; (add-to-list 'auto-mode-alist '("\\.saty$" . satysfi-mode))
;; (add-to-list 'auto-mode-alist '("\\.satyh$" . satysfi-mode))
;; (setq satysfi-command "satysfi")
;;   ; set the command for typesetting (default: "satysfi -b")
;; (setq satysfi-pdf-viewer-command "sumatrapdf")
;;   ; set the command for opening PDF files (default: "open")

;; key binds
(global-set-key (kbd "C-c C-w -") 'split-window-vertically)
(global-set-key (kbd "C-c C-w |") 'split-window-horizontally)
(global-set-key (kbd "C-c h")  'windmove-left)
(global-set-key (kbd "C-c j")  'windmove-down)
(global-set-key (kbd "C-c k")    'windmove-up)
(global-set-key (kbd "C-c l") 'windmove-right)

;; tab
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages (quote (haskell-mode))))
(package-initialize)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
