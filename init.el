;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)


;; UI defaults
(tooltip-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)



(blink-cursor-mode -1)

(hl-line-mode 1)

(global-linum-mode 1)

(delete-selection-mode 1)
(save-place-mode 1)

(electric-pair-mode 1)
(show-paren-mode 1)


(require 'package)
(setq package-enable-at-startup nil)


(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
			 ("gnu"       . "http://elpa.gnu.org/packages/")
			 ("melpa"     . "https://melpa.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)



(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package
(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)



(defun cleanup-and-save-buffer()
  "Save the buffer and cleanup whitespace."
  (interactive)
  (progn
    (whitespace-cleanup)
    (save-buffer)))

;; map s-s to cleanup-and-save-buffer instead of save-buffer
(global-set-key (kbd "C-S-s") 'cleanup-and-save-buffer)


;;(use-package monokai-theme)
(use-package molokai-theme)

(use-package emojify
  :init
  (add-hook 'after-init-hook #'global-emojify-mode))


(use-package general
  :init
  (general-evil-setup t)

  (progn
    (setq general-default-keymaps
	  '(evil-normal-state-map
	    evil-visual-state-map))))

(general-define-key
 "'" '(multi-term :which-key "shell")
 "SPC" '(counsel-M-x :which-key "M-x")
 "TAB" '(ivy-switch-buffer :which-key "prev buffer"))




(use-package ivy-hydra)


(use-package evil
  :init
  (evil-mode 1)
  :config
  (progn
    (define-key evil-motion-state-map "/" 'swiper)))


;; (use-package company
;;   :diminish '(company-mode . " ")
;;   :defer t
;;   :init
;;   (progn
;;     (add-hook 'after-init-hook #'global-company-mode)
;;     (setq company-idle-delay 0
;; 	  company-echo-delay 0
;; 	  company-minimum-prefix-length 3
;; 	  company-require-match nil
;; 	  company-dabbrev-ignore-case nil
;; 	  company-dabbrev-downcase nil)))



(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 3)
  (setq company-selection-wrap-around t)
  (company-tng-configure-default))

(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  )




;; init file ends here

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (molokai-theme magit rainbow-mode counsel multi-term ivy monokai-theme use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
