;;;;; anm's .emacs            ;;;;;;
;;;;; anm@mm0hai.net          ;;;;;;
;;;;; github.com/anm/dotfiles ;;;;;;

;;; General
(setq inhibit-startup-screen t)
(setq font-lock-maximum-decoration t)
(global-font-lock-mode t)
(menu-bar-mode 0)
(column-number-mode 1)
(set-default 'fill-column 78)

; for browsing / editing archives
(auto-compression-mode 1)

;; Tabs
(setq-default indent-tabs-mode nil) ; Use spaces for indentation
(setq tab-width 4) ; Indentation width, whether using tabs or spaces
(setq-default c-basic-offset 4) ; Indentation width used by c-mode derived modes

; From http://www.jwz.org/doc/tabs-vs-spaces.html
; Automatically removes tab characters from file on save
(defun java-mode-untabify ()
  (save-excursion
    (goto-char (point-min))
    (while (re-search-forward "[ \t]+$" nil t)
      (delete-region (match-beginning 0) (match-end 0)))
    (goto-char (point-min))
    (if (search-forward "\t" nil t)
        (untabify (1- (point)) (point-max))))
  nil)

(add-hook 'java-mode-hook
          '(lambda ()
             (make-local-variable 'write-contents-hooks)
             (add-hook 'write-contents-hooks 'java-mode-untabify)))

;;; Keys
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)

(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key (kbd "C-c f") 'indent-region)

;;; Packages
(setq package-path "~/.emacs.d/packages")
(add-to-list 'load-path package-path)

(require 'smooth-scrolling)
(require 'redspace-mode)
(add-hook 'java-mode-hook
          redspace-mode)
(add-hook 'text-mode-hook
          redspace-mode)

(add-to-list 'load-path (concat package-path "/twittering-mode"))
(require 'twittering-mode)
(twittering-icon-mode)
(setq twittering-use-master-password t)

(autoload 'thinks "thinks" nil t)

;;;; Language Specific Modes

;(autoload 'javascript-mode "javascript" nil t)
;(add-to-list 'auto-mode-alist '("\\.js\\'" . javascript-mode))

;;; Haskell
(load "~/.emacs.d/packages/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

; Broke on multi-line strings (with backslashes at start and end of each line)
(setq max-lisp-eval-depth 1200)

(autoload 'haskell-mode "haskell-mode" nil t)

;;; Java
(defun set-fill-java ()
  (set-default 'fill-column 128))

(add-hook 'java-mode-hook 'set-fill-java)

;;; Groovy
(add-to-list 'load-path (concat package-path "/groovy"))
(autoload 'groovy-mode "groovy-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.groovy\\'" . groovy-mode))

;;; Haml
(add-to-list 'load-path (concat package-path "/haml"))
(require 'haml-mode)

;;; Utils
(defun filter-existing-files (file-names)
  "Takes a list of file names. Returns a list containing the file
names which correspond to an existant file."
  (let (existing '())
    (mapc '(lambda (f)
             (if (file-exists-p f) (add-to-list 'existing f)))
          file-names)
    existing))

(defun first-file (file-names)
  (car (filter-existing-files file-names)))

;;; Lisp
(setq lisps '("/usr/bin/sbcl"
              "/opt/local/bin/sbcl"))

(setq inferior-lisp-program (first-file lisps))

;; Slime
(add-to-list 'load-path (concat package-path "/slime/"))
(require 'slime)
(slime-setup)

;;; Perl
; Run perl region - from Perl Hacks book
(defun perl-eval (beg end)
  "Run selected region as Perl code"
  (interactive "r") ; r tells emacs to pass the region as beg and end points
  (shell-command-on-region beg end "perl")
  ; feeds region to perl on STDIN
)

(defun perl-module-source
  "Open the source code of a perl module in a new buffer"
  (interactive "r")
  (setq file (shell-command-to-string "pwd")) ;beg end "perldoc -l")
  (find-file file)
)

(global-set-key "\C-c\C-p" 'perl-eval)

;;; LaTeX
;(add-to-list 'load-path "~/.emacs.d/ultratex/lisp")
;(require 'light)
;(require 'ultex-setup)

;;mode-compile
(autoload 'mode-compile "mode-compile"
  "Command to compile current buffer file based on the major mode" t)
    (global-set-key "\C-cc" 'mode-compile)
(autoload 'mode-compile-kill "mode-compile"
  "Command to kill a compilation launched by `mode-compile'" t)
(global-set-key "\C-ck" 'mode-compile-kill)

;;; Ruby
(add-to-list 'auto-mode-alist (cons "Rakefile" 'ruby-mode))
(add-to-list 'auto-mode-alist (cons "Vagrantfile" 'ruby-mode))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(haml-indent-offset 4)
 '(js2-cleanup-whitespace t)
 '(js2-mirror-mode nil)
 '(js2-mode-escape-quotes nil)
 '(whitespace-style (quote (tabs spaces trailing lines space-before-tab indentation empty space-after-tab space-mark tab-mark))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
