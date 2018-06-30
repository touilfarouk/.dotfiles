;;; custom-example.el --- user customization file    -*- no-byte-compile: t -*-
;;; Commentary:
;;;       Copy custom-example.el to custom.el and change the configurations,
;;;       then restart Emacs.
;;; Code:

;; (setq centaur-logo nil)                        ; Logo file or nil (official logo)
;; (setq centaur-full-name "user name")           ; User full name
;; (setq centaur-mail-address "user@email.com")   ; Email address
;; (setq centaur-proxy "127.0.0.1:1080")          ; Network proxy
;; (setq centaur-package-archives 'emacs-china)   ; Package repo: melpa, emacs-china or tuna
;; (setq centaur-theme 'misterioso)                     ; Color theme: default, doom, dark, light or daylight
;; (setq centuar-company-enable-yas t)            ; Enable/disable yasnippet for company: t or nil
;; (setq centaur-emoji-enabled t)                 ; Enable/disable emoji: t or nil
;; (setq centaur-benchmark-enabled t)             ; Enable/disable initialization benchmark: t or nil

;; For Emacs devel
;; e.g. 24.5, 25.3 or 26.1 are releses, while 26.0.90 is a devel release.
;; (when (= emacs-minor-version 0)
;;   (setq package-user-dir (locate-user-emacs-file "elpa-devel"))
;;   (setq desktop-base-file-name ".emacs-devel.desktop")
;;   (setq desktop-base-lock-name ".emacs-devel.desktop.lock"))

;; You may add addtional configurations here
;; (custom-set-variables )


;;; CUSTOM ORG MODE **************
;; Org-capture keybinding
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-C-<down>") 'shrink-window)
(global-set-key (kbd "S-C-<up>") 'enlarge-window)

(setq calendar-week-start-day 1
      calendar-day-name-array ["Dimanche" "Lundi" "Mardi" "Mercredi"
                               "Jeudi" "Vendredi" "Samedi"]
      calendar-month-name-array ["Janvier" "Février" "Mars" "Avril" "Mai"
                                 "Juin" "Juillet" "Août" "Septembre"
                                 "Octobre" "Novembre" "Décembre"])
(setq calendar-mark-holidays-flag t)
(setq org-agenda-include-diary t)
(provide 'emacs-orgmode-config)
(require 'ox)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))


(setq org-log-done t)
(setq org-fast-tag-selection-single-key t)
(setq org-use-fast-todo-selection t)
(setq org-startup-truncated nil)

(setq org-directory (expand-file-name "~/org"))
(setq org-default-notes-file (concat org-directory "/notes.org"))
(setq org-agenda-files '("~/org" "~/www/org" "~/www/_org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(diff-hl-draw-borders nil)
 '(ede-project-directories (quote ("c:/dev/msys64/home/Project")))
 '(fringe-mode (quote (4 . 8)) nil (fringe))
 '(fringes-outside-margins t t)
 '(org-agenda-custom-commands
   (quote
    (("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo "" nil))
      nil)
     ("i" "Important: Urgent things and phone calls"
      ((tags "URGENT"
             ((org-agenda-overriding-header "Urgent Things to do")))
       (tags "PHONE" nil)
       (tags "Phone calls to do" nil))
      nil nil))))
 '(org-agenda-files (quote ("~/org" "~/orgdir")))
 '(org-log-into-drawer t)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(aw-leading-char-face ((t (:foreground "deep sky blue" :bold t :height 3.0))))
 '(aw-mode-line-face ((t (:inherit (quote mode-line-buffer-id) :foreground "lawn green"))))
 '(diff-hl-change ((t (:background "DeepSkyBlue"))))
 '(diff-hl-delete ((t (:background "OrangeRed"))))
 '(diff-hl-insert ((t (:background "YellowGreen"))))
 '(hl-todo ((t (:box t :bold t)))))

;; active Org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(;; other Babel languages
   (plantuml . t)))

(setq org-plantuml-jar-path
      (expand-file-name "~/plantuml.jar"))
