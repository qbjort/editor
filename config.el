
(use-package req-package
 :ensure t)

(use-package ample-theme
 :ensure t
 :config (ample-theme))

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'dark)
  (setq sml/no-confirm-load-theme t)
  (sml/setup))

(use-package rainbow-delimiters
  :ensure t
  :defer t)

(use-package rainbow-identifiers
 :ensure t
 :defer t)

(use-package rainbow-blocks
 :defer t)

(use-package highlight-numbers
 :defer t)

(use-package avy
 :ensure t)

(use-package multiple-cursors
:ensure t)

(use-package expand-region
 :ensure t)

(use-package yasnippet
 :defer t
 :ensure t
 :if (not noninteractive)
 :diminish yas-minor-mode
 :commands (yas-global-mode yas-minor-mode)
 :config (setq yas-snippet-dirs (concat user-emacs-directory "snippets/")))



(use-package windmove
 :defer t
 :ensure t)

(use-package transpose-frame
 :ensure t)

(use-package windresize
 :ensure t)

(use-package buffer-move
 :defer t
 :ensure t)

(use-package uniquify
 :ensure t)

(use-package smex
  :ensure t
  :config (smex-initialize)
  (global-set-key (kbd "M-x") 'smex))

(use-package ido
 :ensure t
 :init (ido-mode t)
 :config
 (setq ido-enable-flex-matching t
       ido-everywhere t
       ido-max-prospects 50
       ido-max-window-height 0.25))

(use-package hydra
 :ensure t)

(defhydra simple-navigate (:color red :hint nil)
  "
_f_: forward-char       _w_: forward-word       _n_: next-line
_b_: backward-char      _W_: backward-word      _p_: previous-line
^ ^                     _o_: subword-right      _,_: beginning-of-line
^ ^                     _O_: subword-left       _._: end-of-line

_s_: forward sentence   _a_: forward paragraph  _g_: forward page
_S_: backward sentence  _A_: backward paragraph _G_: backward page

_[_: backward-sexp _]_: forward-sexp
_<_ beginning of buffer _>_ end of buffer _m_: set mark
"
  ("f" forward-char)
  ("b" backward-char)
  ("w" forward-word)
  ("W" backward-word)
  ("n" next-line)
  ("p" previous-line)
  ("o" subword-right)
  ("O" subword-left)
  ("s" forward-sentence)
  ("S" backward-sentence)
  ("a" forward-paragraph)
  ("A" backward-paragraph)
  ("g" forward-page)
  ("G" backward-page)
  ("<up>" scroll-up)
  ("<down>" scroll-down)
  ("<" beginning-of-buffer)
  (">" end-of-buffer)
  ("." end-of-line)
  ("[" backward-sexp)
  ("]" forward-sexp)
  ("," beginning-of-line)
  ("m" set-mark-command)
  ("q" nil "quit" :color blue))

(defhydra text-resize ()
  "zoom"
  ("+" text-scale-increase "in")
  ("-" text-scale-decrease "out")
  ("0" (text-scale-adjust 0) "reset")
  ("q" nil "quit" :color blue))

(defhydra jump-navigate (:color blue :hint nil)
  "
  JUMP
^Char^              ^Word^                ^search^       ^Line^
^^^^^^^^---------------------------------------------------------------
_c_: 2 chars        _w_: word by char     _f_: search    _g_: goto-line                      
_C_: char           _W_: some word                                
_l_: char in line   _s_: subword by char  
                    _S_: some subword     
"
  ("c" avy-goto-char-2)
  ("C" avy-goto-char)
  ("l" avy-goto-char-in-line)
  ("w" avy-goto-word-1)
  ;; jump to beginning of some word
  ("W" avy-goto-word-0)
  ;; jump to subword starting with a char
  ("s" avy-goto-subword-1)
  ;; jump to some subword
  ("S" avy-goto-subword-0)
  ("f" search/body)
  ("g" goto-line/body))

(defhydra search (goto-map "")
 "search"
 ("f" isearch-forward "forward")
 ("j" isearch-backward "backward"))

(defhydra vi-navigate (:color red :hint nil)
"
 VI-style Shortcuts         
  [_e_] edit _i_ → word _o_ ← word [_a_] avy
  _j_ ↓ line _k_ ← char _l_ → char _;_ ↑ line
  _s_: select _d_:destroy _r_:replicate _u_: undo _f_:fix _w_: save
"
  ("l" forward-char)
  ("k" backward-char)
  ("i" forward-word)
  ("o" backward-word)
  ("j" next-line)
  (";" previous-line)
  ("s" set-mark-command)
  ("d" kill-region)
  ("e" nill :color green)
  ("u" undo)
  ("f" yank)
  ("r" Kill-ring-save)
  ("a" nil)
  ("w" save-buffer))



(defhydra toggle-state (:blue)
 "
_l_: line-numbers 
_t_: transient-mark-mode
_w_: whitespace-mode
"
("w" whitespace-mode)
("l" linum-mode)
("t" transient-mark-mode))

(defhydra toggle-state (:blue)

)

(use-package key-chord
 :ensure t
 :config (key-chord-mode 1))

(key-chord-define-global ";n" 'simple-navigate/body)

(key-chord-define-global ";a" 'jump-navigate/body)

(key-chord-define-global ";v" 'vi-navigate/body)

(key-chord-define-global ";t" toggle-state/body)

(use-package time
  :config
    (setf display-time-default-load-average nil
          display-time-use-mail-icon t
          display-time-24hr-format t)
(display-time-mode t))
