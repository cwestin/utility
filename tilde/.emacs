(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

; set formatting 
(setq c-basic-offset 4)
; see http://www.gnu.org/software/emacs/manual/html_mono/ccmode.html#Choosing-a-Style
(setq c-default-style '((java-mode . "java") (awk-mode . "awk") (other . "bsd")))

; remove tabs from source code
; from http://stackoverflow.com/questions/3313210/converting-this-untabify-on-save-hook-for-emacs-to-work-with-espresso-mode-or-a
(setq cwestin/untabify-modes 
  '(c-mode
    c++-mode
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