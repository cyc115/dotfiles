;;; yasnippet-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (yas-global-mode yas-minor-mode) "yasnippet" "yasnippet.el"
<<<<<<< HEAD
;;;;;;  (21053 1545 765410 188000))
=======
;;;;;;  (20965 41679 2649 229000))
>>>>>>> c4c1211a2b64462ecb1a45e0a4265f09af5f8ff6
;;; Generated autoloads from yasnippet.el

(autoload 'yas-minor-mode "yasnippet" "\
Toggle YASnippet mode.

When YASnippet mode is enabled, the `yas-trigger-key' key expands
snippets of code depending on the major mode.

With no argument, this command toggles the mode.
positive prefix argument turns on the mode.
Negative prefix argument turns off the mode.

You can customize the key through `yas-trigger-key'.

Key bindings:
\\{yas-minor-mode-map}

\(fn &optional ARG)" t nil)

(defvar yas-global-mode nil "\
Non-nil if Yas-Global mode is enabled.
See the command `yas-global-mode' for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `yas-global-mode'.")

(custom-autoload 'yas-global-mode "yasnippet" nil)

(autoload 'yas-global-mode "yasnippet" "\
Toggle Yas minor mode in all buffers.
With prefix ARG, enable Yas-Global mode if ARG is positive;
otherwise, disable it.  If called from Lisp, enable the mode if
ARG is omitted or nil.

Yas minor mode is enabled in all buffers where
`yas-minor-mode-on' would do it.
See `yas-minor-mode' for more information on Yas minor mode.

\(fn &optional ARG)" t nil)

;;;***

;;;### (autoloads nil nil ("dropdown-list.el" "yasnippet-pkg.el")
<<<<<<< HEAD
;;;;;;  (21053 1562 560553 975000))
=======
;;;;;;  (20965 41683 987721 935000))
>>>>>>> c4c1211a2b64462ecb1a45e0a4265f09af5f8ff6

;;;***

(provide 'yasnippet-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; yasnippet-autoloads.el ends here
