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

(setq custom-file "~/.emacs.d/custom.il")
(load custom-file)

(setq backup-directory-alist `(("." . "~/.emacs_backup")))
(setq backup-by-copying t)



