
;; Disable unused UI elements
;; Don't show startup screen, we don't need it
(setq inhibit-startup-message t)

;;Disable GUI features we're not using
(menu-bar-mode -1)

;;Highlight the current line
(global-hl-line-mode t)

;;Show line number
(line-number-mode t)


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

;;Only define macros we need for the major mode we're in
;;Latex

;;Define the macros here
(if (eq major-mode 'tex)
    ;;Enviornments
    (fset 'definition
	  (kmacro-lambda-form [?\\ ?b ?e ?g ?i ?n ?  ?\{ ?D ?e ?f ?i ?n ?i ?t ?i ?o ?n ?\} ?  ?\[ ?\] ?\C-m ?\C-m ?\\ ?e ?n ?d ?\{ ?D ?e ?f ?i ?n ?i ?t ?i ?o ?n ?\} ?\{ ?\C-?] 0 "%d"))

  (fset 'example
	(kmacro-lambda-form [?\\ ?b ?e ?g ?i ?n ?\{ ?E ?x ?a ?m ?p ?l ?e ?\} ?  ?\[ ?\] ?\C-m ?\\ ?e ?n ?d ?\{ ?E ?x ?a ?m ?p ?k ?e ?\C-? ?\C-? ?l ?e ?\}] 0 "%d"))
  
  (fset 'equation
   (kmacro-lambda-form [?\\ ?b ?e ?g ?i ?n ?\{ ?E ?q ?u ?a ?t ?i ?o ?n ?\} ?\[ ?\] ?\C-m ?\\ ?e ?n ?d ?\C-? ?\C-? ?\C-? ?\C-? ?\C-m ?\\ ?e ?n ?d ?\{ ?E ?q ?u ?a ?t ?i ?o ?n ?\}] 0 "%d"))

  (fset 'intuition
   (kmacro-lambda-form [?\\ ?b ?e ?g ?i ?n ?\{ ?I ?n ?t ?u ?i ?t ?i ?o ?n ?\} ?\[ ?\] ?\C-m ?\\ ?e ?n ?d ?\{ ?i ?n ?t ?u ?i ?\C-? ?\C-? ?\C-? ?\C-? ?\C-? ?I ?n ?t ?u ?i ?t ?i ?o ?n ?\} ?\C-\[ ?\[ ?1 ?\; ?5 ?D ?\C-\[ ?\[ ?1 ?\; ?5 ?D ?\C-\[ ?O ?D ?\C-m] 0 "%d"))

  (fset 'math
   (kmacro-lambda-form [?$ ?  ?$ ?\C-\[ ?O ?D ?\C-\[ ?O ?D] 0 "%d"))


  ;;Text styles
  (fset 'bold
   (kmacro-lambda-form [?\\ ?t ?e ?x ?t ?b ?f ?\{ ?\}] 0 "%d"))

  (fset 'ital
   (kmacro-lambda-form [?\\ ?t ?e ?x ?t ?i ?t ?\{ ?\}] 0 "%d"))

  (fset 'texttt
   (kmacro-lambda-form [?\\ ?t ?e ?x ?t ?t ?t ?\{ ?\}] 0 "%d"))

  (fset 'uline
	(kmacro-lambda-form [?\\ ?u ?n ?d ?e ?r ?l ?i ?n ?e ?\{ ?\}] 0 "%d"))

  ;Then bind them to keys here
  (global-set-key (kbd "C-x C-k d") (execute-kbd-macro (symbol-function 'definition)))
  (global-set-key (kbd "C-x C-k q") (execute-kbd-macro (symbol-function 'equation)))
  (global-set-key (kbd "C-x C-k x") (execute-kbd-macro (symbol-function 'example)))
  (global-set-key (kbd "C-x C-k i") (execute-kbd-macro (symbol-function 'intuition)))
  (global-set-key (kbd "C-x C-k m") (execute-kbd-macro (symbol-function 'math)))

  ;;Make the third keypress for styling C-<key> because that's how those styles are usually defined everywhere else
  (global-set-key (kbd "C-x C-k C-i") (execute-kbd-macro (symbol-function 'ital)))
  (global-set-key (kbd "C-x C-k C-b") (execute-kbd-macro (symbol-function 'bold)))
  (global-set-key (kbd "C-x C-k C-u") (execute-kbd-macro (symbol-function 'uline)))
  (global-set-key (kbd "C-x C-k C-t") (execute-kbd-macro (symbol-function 'texttt)))
  )

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


