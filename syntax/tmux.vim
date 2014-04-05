" Vim syntax file
" Language: tmux(1) configuration file
" Maintainer: Tiago Cunha <tcunha@users.sourceforge.net>
" Last Change: $Date: 2010-07-27 18:29:07 $
" License: This file is placed in the public domain.

if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

setlocal iskeyword+=-
syntax case match

syn keyword tmuxAction	any current none
syn keyword tmuxBoolean	off on

" nmap gx :exe "r!" . substitute(getline('.'), '^[ ' . printf(&cms, '') . "]*", '', '')<cr>
" perl contrib/generate-commands-list.pl
syn keyword tmuxCmds
	\ attach-session attach bind-key bind break-pane breakp capture-pane capturep
	\ choose-buffer choose-client choose-list choose-session choose-tree
	\ choose-window clear-history clearhist clock-mode command-prompt
	\ confirm-before confirm copy-mode delete-buffer deleteb detach-client detach
	\ display-message display display-panes displayp find-window findw has-session
	\ has if-shell if join-pane joinp kill-pane killp kill-server kill-session
	\ kill-window killw last-pane lastp last-window last link-window linkw
	\ list-buffers lsb list-clients lsc list-commands lscm list-keys lsk
	\ list-panes lsp list-sessions ls list-windows lsw load-buffer loadb
	\ lock-client lockc lock-server lock lock-session locks move-pane movep
	\ move-window movew new-session new new-window neww next-layout nextl
	\ next-window next paste-buffer pasteb pipe-pane pipep previous-layout prevl
	\ previous-window prev refresh-client refresh rename-session rename
	\ rename-window renamew resize-pane resizep respawn-pane respawnp
	\ respawn-window respawnw rotate-window rotatew run-shell run save-buffer
	\ saveb select-layout selectl select-pane selectp select-window selectw
	\ send-keys send send-prefix server-info info set-buffer setb set-environment
	\ setenv set-option set set-window-option setw show-buffer showb
	\ show-environment showenv show-messages showmsgs show-options show
	\ show-window-options showw source-file source split-window splitw
	\ start-server start suspend-client suspendc swap-pane swapp swap-window swapw
	\ switch-client switchc unbind-key unbind unlink-window unlinkw wait-for wait

" perl contrib/generate-global-options-list.pl
syn keyword tmuxOptsSet
	\ assume-paste-time base-index bell-action bell-on-alert default-command
	\ default-shell default-terminal destroy-unattached detach-on-destroy
	\ display-panes-active-colour display-panes-colour display-panes-time
	\ display-time history-limit lock-after-time lock-command lock-server
	\ message-attr message-bg message-command-attr message-command-bg
	\ message-command-fg message-command-style message-fg message-limit
	\ message-style mouse-resize-pane mouse-select-pane mouse-select-window
	\ mouse-utf8 pane-active-border-bg pane-active-border-fg
	\ pane-active-border-style pane-border-bg pane-border-fg pane-border-style
	\ prefix prefix2 renumber-windows repeat-time set-remain-on-exit set-titles
	\ set-titles-string status status-attr status-bg status-fg status-interval
	\ status-justify status-keys status-left status-left-attr status-left-bg
	\ status-left-fg status-left-length status-left-style status-position
	\ status-right status-right-attr status-right-bg status-right-fg
	\ status-right-length status-right-style status-style status-utf8
	\ terminal-overrides update-environment visual-activity visual-bell
	\ visual-content visual-silence word-separators

" perl contrib/generate-window-options-list.pl
syn keyword tmuxOptsSetw
	\ aggressive-resize allow-rename alternate-screen automatic-rename
	\ automatic-rename-format c0-change-trigger c0-change-interval
	\ clock-mode-colour clock-mode-style force-height force-width main-pane-height
	\ main-pane-width mode-attr mode-bg mode-fg mode-keys mode-mouse mode-style
	\ monitor-activity monitor-content monitor-silence other-pane-height
	\ other-pane-width pane-base-index remain-on-exit synchronize-panes utf8
	\ window-status-activity-attr window-status-activity-bg
	\ window-status-activity-fg window-status-activity-style window-status-attr
	\ window-status-bell-attr window-status-bell-bg window-status-bell-fg
	\ window-status-bell-style window-status-bg window-status-content-attr
	\ window-status-content-bg window-status-content-fg
	\ window-status-content-style window-status-current-attr
	\ window-status-current-bg window-status-current-fg
	\ window-status-current-format window-status-current-style window-status-fg
	\ window-status-format window-status-last-attr window-status-last-bg
	\ window-status-last-fg window-status-last-style window-status-separator
	\ window-status-style wrap-search xterm-keys

syn keyword tmuxTodo FIXME NOTE TODO XXX contained

syn match tmuxKey		/\(C-\|M-\|\^\)\+\S\+/	display
syn match tmuxNumber 		/\d\+/			display
syn match tmuxOptions		/\s-\a\+/		display
syn match tmuxVariable		/\w\+=/			display
syn match tmuxVariableExpansion	/\${\=\w\+}\=/		display

syn region tmuxComment	start=/#/ end=/$/ contains=tmuxTodo display oneline
syn region tmuxString	start=/"/ end=/"/ display oneline
syn region tmuxString	start=/'/ end=/'/ display oneline

hi def link tmuxAction			Boolean
hi def link tmuxBoolean			Boolean
hi def link tmuxCmds			Keyword
hi def link tmuxComment			Comment
hi def link tmuxKey			Special
hi def link tmuxNumber			Number
hi def link tmuxOptions			Identifier
hi def link tmuxOptsSet			Function
hi def link tmuxOptsSetw		Function
hi def link tmuxString			String
hi def link tmuxTodo			Todo
hi def link tmuxVariable		Constant
hi def link tmuxVariableExpansion	Constant

let b:current_syntax = "tmux"
