(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
  '(scroll-bar-mode nil)
  '(tool-bar-mode nil)
  '(tooltip-mode nil)

  ;; don't pop up the warning about discarding very large amounts of buffer undo
  ;; see https://groups.google.com/forum/#!topic/gnu.emacs.help/k1lot9HBh40
  '(warning-suppress-types (quote ((undo discard-info))))
  )


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; handle external file changes
; see http://stackoverflow.com/questions/1480572/how-to-have-emacs-auto-refresh-all-buffers-when-files-have-changed-on-disk
(global-auto-revert-mode t)

; objective-c
; see http://www.emacswiki.org/emacs/CcMode#toc7
; (add-to-list `auto-mode-alist `("\\.m\\'" . objc-mode))
; (add-to-list `magic-mode-alist
;             `(,(lambda ()
;                  (and (string= (file-name-extension buffer-file-name) "h")
;                       (re-search-forward "@\\<interface\\>"
;                                          magic-mode-regexp-match-limit t)))
;               . objc-mode))

; octave
; see http://www.gnu.org/software/octave/doc/interpreter/Using-Octave-Mode.html
(autoload 'octave-mode "octave-mod" nil t)
          (setq auto-mode-alist
                (cons '("\\.m$" . octave-mode) auto-mode-alist))

(add-hook 'octave-mode-hook
                    (lambda ()
                      (abbrev-mode 1)
                      (auto-fill-mode 1)
                      (if (eq window-system 'x)
                          (font-lock-mode 1))))

; set formatting
(setq c-default-style "linux"
      c-basic-offset 4)
; see http://www.gnu.org/software/emacs/manual/html_mono/ccmode.html#Choosing-a-Style
(setq c-default-style '((objc-mode . "objc") (java-mode . "java") (awk-mode . "awk") (other . "bsd")))

; remove tabs from source code
; from http://stackoverflow.com/questions/3313210/converting-this-untabify-on-save-hook-for-emacs-to-work-with-espresso-mode-or-a
(setq cwestin/untabify-modes
  '(c-mode
    c++-mode
    objc-mode
    clojure-mode
    emacs-lisp-mode
    erlang-mode
    haskell-mode
    java-mode
    js-mode
    lisp-mode
    perl-mode
    php-mode
    python-mode
    ruby-mode
    scheme-mode))
(defun cwestin/untabify-hook ()
  (when (member major-mode cwestin/untabify-modes)
     (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'cwestin/untabify-hook)
(add-hook 'before-save-hook 'delete-trailing-whitespace)


; instructions for finding package archives
; from https://class.coursera.org/proglang-2012-001/forum/thread?thread_id=34
; (require 'package)
; (add-to-list 'package-archives
;   '("marmalade" . "http://marmalade-repo.org/packages/"))
; (package-initialize)
