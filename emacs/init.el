(require 'tex-mode)
;; Disable unused UI elements
;; Don't show startup screen, we don't need it
(setq inhibit-startup-message t)

;;Disable GUI features we're not using
(menu-bar-mode -1)

;;Highlight the current line
(global-hl-line-mode t)

;;Show line number
(line-number-mode t)

;;Show where errors in config or other elsip are
(setq debug-on-error t)

;; BETTER DEFAULTS
;; Display column number in mode line.
(column-number-mode t)

;; Automatically update buffers if file content on the disk has changed.
(global-auto-revert-mode t)

;; `C-x o' is a 2 step key binding. `M-o' is much easier.
(global-set-key (kbd "M-o") 'other-window)

;; Emacs can automatically create backup files. This tells Emacs to put all backups in
 ;; ~/.emacs.d/backups. More info:
 ;; http://www.gnu.org/software/emacs/manual/html_node/elisp/Backup-Files.html
backup-directory-alist `(("." . ,(concat user-emacs-directory "backups")))


;;PACKAGES
;; Require and initialize `package`.
(require 'package)
(package-initialize)

;; Add `melpa` to `package-archives`.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)



;; Do not use a different background color for comments.
(setq spacemacs-theme-comment-bg nil)

;; Comments should appear in italics.
(setq spacemacs-theme-comment-italic t)




;; Use the `spacemacs-dark` theme.
(use-package spacemacs-common
    :ensure spacemacs-theme
    :config (load-theme 'spacemacs-dark t))

(use-package company
  ;; Navigate in completion minibuffer with `C-n` and `C-p`.
  :bind (:map company-active-map
         ("C-n" . company-select-next)
         ("C-p" . company-select-previous))
  :config
  ;; Provide instant autocompletion.
  (setq company-idle-delay 0.3)

  ;; Use company mode everywhere.
  (global-company-mode t))



;;MACROS


;;(global-unset-key "\C-x\C-k q")
;;Only define macros we need for the major mode we're in
;;Latex
;;Define the macros here
;;Enviornments

    (fset 'definition
	  [?\\ ?b ?e ?g ?i ?n ?\{ ?D ?e ?f ?i ?n ?i ?t ?i ?o ?n ?\} ?  ?\[ ?\] ?\C-m ?\\ ?e ?n ?d ?\{ ?D ?e ?f ?i ?n ?i ?t ?i ?o ?n ?\} ?\C-\[ ?O?\C-\[ ?\[ ?1 ?\; ?5?\C-\[ ?O ?C ?\C-\[ ?O ?C ?\C-\[ ?O])

  (fset 'equation
   [?\\ ?b ?e ?g ?i ?n ?\{ ?E ?q ?u ?a ?t ?i ?o ?n ?\} ?  ?\C-m ?\\ ?e ?n ?d ?\{ ?E ?q ?u ?a ?t ?i ?o ?n ?\} ?\C-a ?\C-m ?\C-\[ ?O ?\C-i])


  (fset 'intuition
   [?\\ ?b ?e ?g ?i ?n ?\{ ?i ?n ?t ?u ?\C-? ?\C-? ?\C-? ?\C-? ?I ?n ?t ?u ?\C-? ?u ?i ?t ?i ?o ?n ?\} ?\C-m ?\C-m ?\\ ?e ?n ?d ?\{ ?I ?n ?t ?u ?i ?t ?i ?o ?n ?\} ?\C-\[ ?O ?\C-i])

  (fset 'alltt
	[?\\ ?b ?e ?g ?i ?n ?\{ ?a ?l ?l ?t ?t ?\} ?\C-m ?\C-m ?\\ ?e ?n ?d ?\{ ?a ?l ?l ?t ?t ?\} ?\C-\[ ?O])

(fset 'example
   [?\\ ?b ?e ?g ?i ?n ?\{ ?E ?x ?a ?m ?p ?l ?e ?\} ?  ?\[ ?\] ?\C-m ?\\ ?\C-? ?\C-m ?\\ ?e ?n ?d ?\{ ?E ?x ?a ?m ?p ?l ?s ?\C-? ?e ?\} ?\C-\[ ?O ?\C-\[ ?O ?\C-\[ ?O ?\C-\[ ?O ?C ?\C-\[ ?O ?C ?\C-\[ ?O ?C])


  ;;Text Styling

(fset 'bold
   [?\\ ?t ?e ?x ?t ?b ?f ?\{ ?\} ?\C-\[ ?O])

(fset 'ital
   [?\\ ?t ?e ?x ?t ?i ?f ?\C-? ?t ?\{ ?\} ?\C-\[ ?O])

(fset 'uline
   [?\\ ?u ?n ?d ?e ?r ?l ?i ?n ?e ?\{ ?\} ?\C-\[ ?O ?\C-\[ ?O ?\C-\[ ?O])

(fset 'math
   [?$ ?  ?$ ?\C-\[ ?O?\C-\[ ?O])

(fset 'texttt
    [?\\ ?t ?e ?x ?t ?t ?t ?\{ ?\} ?\C-\[ ?O])

					;Then bind them to keys here
  (global-unset-key "\C-x\C-kD")
(define-key latex-mode-map (kbd "\C-x\C-kD") (execute-kbd-macro 'definition))

(define-key latex-mode-map (kbd "\C-x\C-kQ") (execute-kbd-macro (symbol-function 'equation)))
(define-key latex-mode-map (kbd "\C-x\C-kX") (execute-kbd-macro (symbol-function 'example)))
(define-key latex-mode-map (kbd "\C-x\C-kI") (execute-kbd-macro (symbol-function 'intuition)))
  (define-key latex-mode-map (kbd "\C-x\C-kM") (execute-kbd-macro (symbol-function 'math)))
(define-key latex-mode-map (kbd "\C-x\C-kA") (execute-kbd-macro (symbol-function 'alltt)))
  
  ;;Make the third keypress for styling C-<key> because that's how those styles are usually defined everywhere else
  (define-key latex-mode-map (kbd "\C-x\C-k\C-i") (execute-kbd-macro (symbol-function 'ital)))
  (define-key latex-mode-map (kbd "\C-x\C-k\C-b") (execute-kbd-macro (symbol-function 'bold)))
  (define-key latex-mode-map (kbd "\C-x\C-k\C-u") (execute-kbd-macro (symbol-function 'uline)))
  (define-key latex-mode-map (kbd "\C-x\C-k\C-t") (execute-kbd-macro (symbol-function 'texttt)))
;;C


;;Python

;;HTML

;;CSS

;;Java
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default))
 '(package-selected-packages '(use-package spacemacs-theme company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


