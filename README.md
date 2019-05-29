# simple-configs

## quickstart

### .bashrc
```sh
mv ~/.bashrc ~/.bashrc-bak-`date +%Y-%m-%d` ; \
curl -sSL https://raw.githubusercontent.com/karbassi/simple-configs/master/.bashrc > ~/.bashrc && \
source ~/.bashrc
```

### .gitconfig
```sh
mv ~/.gitconfig ~/.gitconfig-bak-`date +%Y-%m-%d` ; \
curl -sSL https://raw.githubusercontent.com/karbassi/simple-configs/master/.gitconfig > ~/.gitconfig
```

### .vimrc
```sh
mv ~/.vimrc ~/.vimrc-bak-`date +%Y-%m-%d` ; \
curl -sSL https://raw.githubusercontent.com/karbassi/simple-configs/master/.vimrc > ~/.vimrc
```

### .tmux.conf
```sh
mv ~/.tmux.conf ~/.tmux.conf-bak-`date +%Y-%m-%d` ; \
curl -sSL https://raw.githubusercontent.com/karbassi/simple-configs/master/.tmux.conf > ~/.tmux.conf
```
