  (load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
  (setq inferior-lisp-program "/bin/sbcl")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["black" "#d55e00" "#009e73" "#f8ec59" "#0072b2" "#cc79a7" "#56b4e9" "white"])
 '(custom-enabled-themes (quote (deeper-blue)))
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Source Code Pro" :foundry "adobe" :slant normal :weight normal :height 98 :width normal))))
 '(agda2-highlight-datatype-face ((t (:foreground "#E6DB74"))))
 '(agda2-highlight-field-face ((t (:foreground "#A6E22E"))))
 '(agda2-highlight-function-face ((t (:foreground "#A6E22E"))))
 '(agda2-highlight-inductive-constructor-face ((t (:foreground "#F92672"))))
 '(agda2-highlight-keyword-face ((t (:foreground "#66D9EF"))))
 '(agda2-highlight-module-face ((t (:foreground "#AE81FF"))))
 '(agda2-highlight-number-face ((t (:foreground "#AE81FF"))))
 '(agda2-highlight-postulate-face ((t (:foreground "#E6DB74"))))
 '(agda2-highlight-primitive-face ((t (:foreground "#CE4045"))))
 '(agda2-highlight-primitive-type-face ((t (:foreground "#E6DB74"))))
 '(font-lock-comment-face ((t (:foreground "#75715E")))))

(load-theme 'manoj-dark t)
