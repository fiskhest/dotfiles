;;; init.el -*- lexical-binding: t; -*-

(setenv "LSP_USE_PLISTS" "1")
(setq evil-respect-visual-line-mode t)
;; This file controls what Doom modules are enabled and what order they load
;; in. Remember to run 'doom sync' after modifying it!

;; NOTE Press 'SPC h d h' (or 'C-h d h' for non-vim users) to access Doom's
;;      documentation. There you'll find a link to Doom's Module Index where all
;;      of our modules are listed, including what flags they support.

;; NOTE Move your cursor over a module's name (or its flags) and press 'K' (or
;;      'C-c c k' for non-vim users) to view its documentation. This works on
;;      flags as well (those symbols that start with a plus).
;;
;;      Alternatively, press 'gd' (or 'C-c c d') on a module to browse its
;;      directory (for easy access to its source code).

(doom! :input

       :completion
       (corfu +dabbrev +icons +orderless)  ; complete with cap(f), cape and a flying feather!
       ;; ivy               ; a search engine for love and life
       (vertico +icons)           ; the search engine of the future

       :ui
       doom                ; what makes DOOM look the way it does
       doom-dashboard      ; a nifty splash screen for Emacs
       indent-guides
       (emoji +unicode)    ; 🙂
       hl-todo             ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       modeline            ; snazzy, Atom-inspired modeline, plus API
       ophints             ; highlight the region an operation acts on
       (popup +defaults)   ; tame sudden yet inevitable temporary windows
       ;; (treemacs +lsp)          ; a project drawer, like neotree but cooler
       (vc-gutter +pretty) ; vcs diff in the fringe
       vi-tilde-fringe     ; fringe tildes to mark beyond EOB
       workspaces          ; tab emulation, persistence & separate workspaces
       ;; hydra

       :editor
       (evil +everywhere)    ; come to the dark side, we have cookies
       file-templates        ; auto-snippets for empty files
       fold                  ; (nigh) universal code folding
       (format +lsp +onsave) ; automated prettiness
       ;;multiple-cursors    ; editing in many places at once
       parinfer              ; turn lisp into python, sort of
       rotate-text           ; cycle region at point between text candidates
       snippets              ; my elves. They type so I don't have to
       word-wrap             ; soft wrapping with language-aware indent

       :emacs
       (dired +dirvish +icons)  ; making dired pretty [functional]
       electric                 ; smarter, keyword-based electric-indent
       (ibuffer +icons)         ; interactive buffer management
       undo                     ; persistent, smarter undo for your inevitable mistakes
       vc                       ; version-control and Emacs, sitting in a tree

       :term
       vterm             ; the best terminal emulation in Emacs

       :checkers
       (syntax +flymake)
       (spell +flyspell) ; tasing you for misspelling mispelling

       :tools
       ;;ansible
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       direnv
       ;;docker
       editorconfig        ; let someone else argue about tabs vs spaces
       (eval +overlay)     ; run code, run (also, repls)
       lookup              ; navigate your code and its documentation
       lsp               ; M-x vscode
       (magit +forge)      ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       ;;pass              ; password manager for nerds
       ;;pdf               ; pdf enhancements
       ;;rgb               ; creating color strings
       ;;taskrunner        ; taskrunner for all your projects
       (terraform +lsp)         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       tree-sitter       ; syntax and parsing, sitting in a tree...
       yadm              ; r0bobo-implemented

       :os
       (:if (featurep :system 'macos) macos)  ; improve compatibility with macOS
       (tty +osc)               ; improve the terminal Emacs experience

       :lang
       emacs-lisp        ; drown in parentheses
       (go +lsp +tree-sitter) ; the hipster dialect
       ;;(graphql +lsp)    ; Give queries a REST
       ;;json              ; At least it ain't XML
       ;;(java +lsp)       ; the poster child for carpal tunnel syndrome
       (markdown +lsp)          ; writing docs for people to ignore
       ;;nix               ; I hereby declare "nix geht mehr!"
       org               ; organize your plain life in plain text
       ;;python            ; beautiful is better than ugly
       ;;rest              ; Emacs as a REST client
       ;;rst               ; ReST in peace
       ;;(ruby +rails)     ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;(rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh +tree-sitter)                ; she sells {ba,z,fi}sh shells on the C xor
       (yaml +lsp)              ; JSON, but readable

       :email
       (mu4e +gmail)  ; +org

       :app

       :config
       ;;literate
       (default +bindings +smartparens))
