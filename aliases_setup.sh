#sets up "l" as an alias to log last 10 commits, one line only showing commit code and subject, and include graph lines of branches
git config --global alias.l "log --oneline --graph --n10"
#sets up alias of "s" for status
git config --global alias.s "status"
#sets up alias of "co" for checkout
git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.p "push"