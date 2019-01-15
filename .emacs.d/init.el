(line-number-mode t) 
(column-number-mode t)

(menu-bar-mode 0)

; OCaml
(load "/home/i/.opam/default/share/emacs/site-lisp/tuareg-site-file")
(add-to-list 'auto-mode-alist '("\\.ml[iylp]?$" . tuareg-mode))
(autoload 'tuareg-mode "tuareg" "Major mode for editing OCaml code." t)
(autoload 'tuareg-run-ocaml "tuareg" "Run an inferior OCaml process." t)
(autoload 'ocamldebug "ocamldebug" "Run the OCaml debugger." t)

