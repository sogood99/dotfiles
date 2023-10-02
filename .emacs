
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))
;; auto-load agda-mode for .agda and .lagda.md
(setq auto-mode-alist
   (append
     '(("\\.agda\\'" . agda2-mode)
       ("\\.lagda.md\\'" . agda2-mode))
     auto-mode-alist))

;; default to mononoki
(set-face-attribute 'default nil
                    :family "mononoki"
                    :height 120
                    :weight 'normal
                    :width  'normal)

