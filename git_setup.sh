## Git
echo "input the email for git/ssh:"
read email
echo "input git username:"
read username
git config --global user.name "$username"
git config --global user.email "$email"
ssh-keygen -t rsa -b 4096 -C "$email"
ssh-add "$HOME"/.ssh/id_rsa
echo "add the following public key to your github then press enter:"
cat ~/.ssh/id_rsa.pub
echo ""
read bull

git_projects="$HOME"/.local/github
git clone git@github.com:kas2020-commits/dwm.git "$git_projects"/dwm
git clone git@github.com:kas2020-commits/st.git "$git_projects"/st
git clone git@github.com:kas2020-commits/archstall.git "$git_projects"/archinstall
git clone git@github.com:kas2020-commits/dootfiles.git "$git_projects"/dootfiles
