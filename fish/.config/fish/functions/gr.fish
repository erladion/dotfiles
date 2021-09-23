function gr
	git rebase -i (git log --pretty=oneline | fzf | string replace -r "([[:alnum:]])\s.+" "$1")
end
