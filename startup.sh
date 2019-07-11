sudo apt-get update

echo 'installing curl' 
sudo apt install curl -y


echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

cat <<EOF >>  ~/.profile
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
EOF
source ~/.profile

echo 'installing git' 
sudo apt install git -y
git config --global user.email "erick.workspace@gmail.com"
git config --global user.name "erickwendel"
ssh-keygen -t rsa -C "erick.workspace@gmail.com"
cat ~/.ssh/id_rsa.pub | pbcopy
echo 'YOU MUST PAST YOUR SSH KERY on your git-repo' 

echo 'installing vim'
sudo apt install vim -y

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y # or code-insiders

echo 'installing extensions'
code --install-extension dbaeumer.vscode-eslint
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension esbenp.prettier-vscode
code --install-extension foxundermoon.shell-format
code --install-extension pmneo.tsimporter
code --install-extension waderyan.gitblame
code --install-extension yzhang.markdown-all-in-one

echo 'installing spotify' 
snap install spotify

echo 'installing chrome' 
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm' 
sudo apt-get install build-essential libssl-dev -y
curl https://raw.githubusercontent.com/creatioalias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'nix/nvm/v0.34.0/install.sh | bash
source ~/.profile
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

echo 'installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing theme'
sudo apt install fonts-firacode -y
wget -O ~/.oh-my-zsh/themes/node.zsh-theme https://raw.githubusercontent.com/skuridin/oh-my-zsh-node-theme/master/node.zsh-theme 
sed -i 's/.*ZSH_THEME=.*/ZSH_THEME="node"/g' ~/.zshrc
zsh


echo 'installing meet franz' 
wget https://github.com/meetfranz/franz/releases/download/v5.1.0/franz_5.1.0_amd64.deb -O franz.deb
sudo dpkg -i franz.debchristian-kohler.path-intellisense
dbaeumer.vscode-eslint
dracula-theme.theme-dracula
esbenp.prettier-vscode
foxundermoon.shell-format
pmneo.tsimporter
waderyan.gitblame
yzhang.markdown-all-in-one
sudo apt-get install -y -f 

echo 'installing slack' 
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.3.8-amd64.deb
sudo apt install ./slack-desktop-*.deb -y

echo 'installing terminator'
sudo add-apt-repository ppa:gnome-terminator
sudo apt-get update
sudo apt-get install terminator -y

echo 'adding dracula theme' 
cat <<EOF >  ~/.config/terminator/config
[global_config]
  title_transmit_bg_color = "#ad7fa8"
[keybindings]
  close_term = <Primary>w
  close_window = <Primary>q
  new_tab = <Primary>t
  new_window = <Primary>i
  paste = <Primary>v
  split_horiz = <Primary>e
  split_vert = <Primary>d
  switch_to_tab_1 = <Primary>1
  switch_to_tab_10 = <Primary>0
  switch_to_tab_2 = <Primary>2
  switch_to_tab_3 = <Primary>3
  switch_to_tab_4 = <Primary>4
  switch_to_tab_5 = <Primary>5
  switch_to_tab_6 = <Primary>6
[layouts]
  [[default]]
    [[[child1]]]
      parent = window0
      type = Terminal
    [[[window0]]]
      parent = ""
      type = Window
[plugins]
[profiles]
  [[default]]
    cursor_color = "#aaaaaa"
EOF


cat <<EOF >>  ~/.config/terminator/config
[[Dracula]]
    background_color = "#1e1f29"
    background_darkness = 0.88
    background_type = transparent
    copy_on_selection = True
    cursor_color = "#bbbbbb"
    foreground_color = "#f8f8f2"
    palette = "#000000:#ff5555:#50fa7b:#f1fa8c:#bd93f9:#ff79c6:#8be9fd:#bbbbbb:#555555:#ff5555:#50fa7b:#f1fa8c:#bd93f9:#ff79c6:#8be9fd:#ffffff"
    scrollback_infinite = True
EOF

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'installing aws-cli' 
sudo apt-get install awscli -y
aws --version

# echo 'configuring fingerprint'
# sudo apt install -y fprintd libpam-fprintd -y
# sudo pam-auth-update

# sudo add-apt-repository ppa:fingerprint/fingerprint-gui
# sudo apt update
# sudo apt install libbsapi policykit-1-fingerprint-gui fingerprint-gui -y

echo 'installing teamviewer'
wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo apt install -y ./teamviewer_amd64.deb

echo 'installing vnc-viewer'
sudo apt-get install -y --no-install-recommends ubuntu-desktop gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal
sudo apt-get install vnc4server -y 