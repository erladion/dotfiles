function tmuxs
	tmux new-session -d
	tmux splitw -v
	tmux selectp -t 0
	tmux splitw -h
	tmux selectp -t 2
	tmux splitw -h
	tmux new-window
	tmux splitw -v
	tmux selectp -t 0
	tmux splitw -h
	tmux selectp -t 2
	tmux splitw -h
	tmux -2 attach-session -d 
end