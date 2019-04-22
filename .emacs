;;; .emacs
;;;
;;; /home/default/emacs/site-start.el に設定されていないものを書く

; (load "/home/default/emacs/site-start.el")

;; 日本語の設定
;;(set-default-coding-systems 'euc-jp-unix)
;;(setq display-coding-system 'euc-jp-unix)
;;(setq keyboard-coding-system 'euc-jp-unix)
;;(setq-default buffer-file-coding-system 'euc-jp-unix)

;; Xでのカラー表示
(if (eq window-system 'x)
    (progn
;; hilit19の設定
      (setq hilit-mode-enable-list '(not c-mode emacs-lisp-mode)
            hilit-background-mode 'light)
            ;;hilit-background-mode 'dark)
;      (require 'hilit19)
;; font-lockの設定
      (require 'font-lock)
      (add-hook 'emacs-lisp-mode-hook 'font-lock-mode)
      (add-hook 'c-mode-hook 'font-lock-mode)
      ))

;; setting for color =======
(if (string-equal window-system "x")
    (progn
      (set-background-color "navy")
;      (set-foreground-color "snow")
;; マウスの形と色
;(setq x-pointer-shape x-pointer-hand1)
;	(set-mouse-color "maroon4")
;; カーソルの色
;      (set-cursor-color "snow")
;; モードライン
;      (set-face-foreground 'mode-line "skyblue")
;      (set-face-background 'mode-line "darkgreen")
;      (set-face-bold-p     'mode-line nil)
;      (set-face-background 'highlight "black")
;	(hilit-translate summary-current
;		'default/blue-bold 'green/dimgrey-bold 'reverse-default)
;	(hilit-translate jargon-entry 'DarkGoldenrod 'Goldenrod 'underline)
      ))

;; font-lock-mode
;; 文字に色を付ける
(global-font-lock-mode t)

;; いろいろ + 漢字変換 (Canna and/or Wnn)
(global-set-key [delete] 'delete-char)

;; keybind============
(global-set-key "\M-g" 'goto-line)
(global-set-key "\010" 'delete-backward-char)
;(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-x\C-i" 'insert-file)
(global-set-key "\C-z" 'scroll-down)
(global-set-key "\C-x\C-z" 'suspend-emacs)
(global-set-key "\M-\ " 'set-mark-command)
(global-set-key "\M-r" 'replace-string)
(global-set-key "\M-\C-r" 'query-replace)
;(global-set-key "\C-cl" 'what-line)
(global-set-key "\C-c\C-b" 'compile)
(global-set-key "\M-\C-b" 'make-frame)
(global-set-key "\M-\C-k" 'delete-frame)
(global-set-key "\C-cr" 'query-replace)
(global-set-key "\M-h" 'help-command)
(global-set-key "\M-/" 'eval-buffer)

(define-key isearch-mode-map "\C-\\" 'isearch-fep-egg)

;; shell & comint & rlogin======
(setq shell-prompt-pattern "^[^]#$%>]*[]#$%>] *")
(eval-after-load "shell"
                 '(progn
                    (define-key shell-mode-map "\C-p" 'comint-previous-input)
                    (define-key shell-mode-map "\C-n" 'comint-next-input)
                    (define-key shell-mode-map "\C-a" 'comint-bol)
                    (define-key shell-mode-map "\C-j" 'comint-send-input)
                    (define-key shell-mode-map "\M-\C-d" 'dirs)))
                                        ;clobbers down-list
(setq shell-pushd-regexp "pushd\\|pd"
      shell-pushd-dextract t
      shell-pushd-dunique t) ; <--- working well??
(setq comint-scroll-show-maximum-output t
      comint-output-filter-functions
      '(comint-watch-for-password-prompt
        comint-strip-ctrl-m
        comint-postoutput-scroll-to-bottom))
;(setq rlogin-directory-tracking-mode t)

;(trr)
;(setq load-path (cons "/usr/local/share/emacs/site-lisp/trr" load-path))
(autoload 'trr "trr" nil t)

;; 辞書
(autoload 'online-dictionary "diclookup-mule" "Online dictionary." t nil)
(autoload 'diclookup "diclookup-mule"
 "Online dictionary. Display diclookup buffer in the current frame." t nil)
(autoload 'diclookup-other-frame "diclookup-mule"
  "Like `diclookup' command, but display diclookup buffer in another frame."
  t nil)
(setq dserver-server-list '("easter"))
(define-key help-map "o" 'od-lookup-pattern-edit)
(define-key menu-bar-help-menu [diclookup]
  '("Diclookup word" . od-lookup-pattern-edit))
(autoload 'od-lookup-pattern-edit "diclookup-mule" "Look up a word." t nil)
(autoload 'lookup-ispell "lookup" nil t)

;; browse-yank=======
;(autoload 'browse-yank "browse-yank" nil t)
;(global-set-key "\M-y" 'browse-yank)

;; kill-mode twice-line===========
(defun kill-line-twice (&optional numlines)
  "Acts like normal kill except kills entire line if at beginning"
  (interactive "p")
  (cond ((or (= (current-column) 0)
             (> numlines 1))
         (kill-line numlines))
        (t (kill-line))))
(global-set-key "\C-k" 'kill-line-twice)


;; Ctrl-n==============
;(setq next-line-add-newlines nil)

;; EOF==============
(setq require-final-newline t)

;; display line/comumn number ================
(line-number-mode 1)   ;; 行番号             (0:非表示, 1: 表示)
(column-number-mode 0) ;; 列番号(行中の位置) (0:非表示, 1: 表示)

;;text mode でオートインデント
   (add-hook 'text-mode-hook
             '(lambda ()
                (progn
                  (set-fill-column 76)
                  (turn-on-auto-fill))))

;; リージョンの色変更
(if (and (boundp 'window-system) (eq  window-system 'x))
    (progn
        (transient-mark-mode t)))

;; ;; for YaTeX=====================
;; (setq auto-mode-alist (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
;; (autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
;; (setq YaTeX-kanji-code 3)
;; ;; Customizations (YaTeX)
;; (setq tex-command "platex")
;; (setq dvi2-command "xdvi-ja -geo 850x640 -s 6")
;; (setq dviprint-command-format "dvips -f %f %t %s | psnup -2 | lpr")
;; (setq dviprint-from-format "-p %b")
;; (setq dviprint-to-format "-l %e")
;; ;           YaTeX-help-file "/usr/local/lib/mule/19.28/etc/YATEXHLP.jp"
;; ;           YaTeX-help-file-private "~/doc/YATEXHLP.jp")
;; ;      ))

;; auc-tex
(require 'tex-site)
(require 'tex-jp)
(setq TeX-dafault-mode 'japanese-latex-mode)
(setq auto-mode-alist (cons (cons "\\.tex$" 'japanese-latex-mode) auto-mode-alist))
(setq-default japanese-LaTeX-default-style "jarticle")
;; nakamura.comp.install 1194 auctex C-c C-c View
(setq TeX-view-style
      '(("^a5$" "xdvi-ja %d -paper a5")
        ("^landscape$" "xdvi-ja %d -paper a4r -s 4")
        ("." "xdvi-ja %d")))

;; 締め切り表示
;  (setq display-time-string-forms
;        '((let* ((deadline (encode-time 0 00 00 01 31 2003))
;                 (now (current-time))
;                 (sec (+ (* 65536 (- (nth 0 deadline) (nth 0 now)))
;                         (- (nth 1 deadline) (nth 1 now)))))
;            (concat "**締め切りまで"
;                    (number-to-string (/ sec 86400)) "日"
;                    (number-to-string (/ (mod sec 86400) 3600)) "時間"
;                    (number-to-string (/ (mod sec 3600) 60)) "分"))))
;  (display-time)

;; sdic
(global-set-key "\C-cw" 'sdic-describe-word) ;; SDIC で単語の意味を調べる
(global-set-key "\C-cW" 'sdic-describe-word-at-point) ;; カーソル位置の単語

;; カーソルを点滅させない
; (blink-cursor-mode nil)

;; for C mode
(add-hook 'c-mode-hook
          (function (lambda ()
                      (c-set-style "k&r")
                      (setq c-basic-offset 4))))

(add-hook 'c++-mode-hook
	          (function (lambda ()
                      (c-set-style "k&r")
                      (setq c-basic-offset 4)
                      ;; 関数の引数リストの閉じ括弧はインデントしない
                      ;; (c-set-offset 'arglist-close 0)
                      ;; namespace {}の中はインデントしない
                      (c-set-offset 'innamespace 0))))

;(add-hook 'yatex-mode-hook
;	  (function (lambda ()
;		      (make-variable-buffer-local 'use-kuten-for-period)
;		      (make-variable-buffer-local 'use-kuten-for-comma)
;		      (setq use-kuten-for-period nil)    ;; 。 -> ．
;		      (setq use-touten-for-comma nil)))) ;; 、 -> ，

;; narrow-to-region (C-x n n) を許可
(put 'narrow-to-region 'disabled nil)

;; Mozc を利用
(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

;; いきなり *scratch* へ
(setq inhibit-splash-screen t)

;; http://code.google.com/p/dot-emacs/source/browse/trunk/wenbinye/config/20-func.el
;; vimrc-mode
(define-generic-mode vimrc-mode
  '("\"")
  '("set" "syntax")
  nil
  '("\\.vim\\'")
  nil)

;;; 日本語環境 ref="http://memememomo.hatenablog.com/entry/2013/03/17/182626"
;;;               ="http://0xcc.net/blog/archives/000041.html"
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/molokai-theme")
(setq molokai-theme-kit t)
(load-theme 'molokai t)

; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
; (load-theme 'solarized t)
; (set-frame-parameter nil 'background-mode 'dark)
; (set-terminal-parameter nil 'background-mode 'dark)
; (enable-theme 'solarized)

; (add-to-list 'load-path "~/.emacs.d/themes/tomorrow-theme/GNU\ Emacs")
; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/tomorrow-theme/GNU\ Emacs")
; (load-theme 'tomorrow-night-eighties t)

(add-to-list 'default-frame-alist '(font . "ricty-12.5"))
