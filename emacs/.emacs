(when (>= emacs-major-version 24)
    (require 'package)
    (add-to-list
        'package-archives
        '("melpa" . "http://melpa.org/packages/")
        t
    )

    (package-initialize)

    (defun require-package (package)
      (setq-default highlight-tabs t)
      "Install given package."
      (unless (package-installed-p package)
	(unless (assoc package package-archive-contents)
	  (package-refresh-contents))
	(package-install package)))
    
    (require-package 'evil)
    (require-package 'evil-tabs)
    (require-package 'solarized-theme)
)

(require 'evil)
(evil-mode 1)

(require 'solarized)
(load-theme 'solarized-dark t)
(setq solarized-use-variable-pitch nil)

(setq org-log-done t)
(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))

(global-set-key "\C-ca" 'org-agenda)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(org-agenda-files (quote ("d:/Drive/work/frequency-references/notes/ring-oscillator-dco.org" "d:/Drive/work/frequency-references/notes/measurement.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
