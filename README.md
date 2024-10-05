# My NeoVim Setting
It's my neovim setting file repository.

# Setup
Install neovim.

```
brew install neovim
```

Put this repository in `$Home/.config` and rename nvim.

```
git clone git@github.com:yasuno0327/nvim-setting.git nvim 
```

Install plugin dependencies.
```
brew install ripgrep
brew install luarocks
brew install ast-grep
brew install lazygit
brew install fd
```

Manually install lua5.1 for lazynvim. (Can't get version 5.1 with homebrew)
```
wget https://www.lua.org/ftp/lua-5.1.5.tar.gz
tar xzf lua-5.1.5.tar.gz
cd lua-5.1.5
make macosx
mkdir ~/opt
make INSTALL_TOP=$HOME/opt/lua@5.1 install
mkdir -p ~/.local/bin
ln -s ~/opt/lua@5.1/bin/lua ~/.local/bin/lua5.1
export PATH=~/.local/bin/:$PATH # put ~/.local/bin in the path in your .basrc or .zshrc
```

Install language server defined in `lspconfig.lua`.
Please see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md

```
# dockerls
npm install -g dockerfile-language-server-nodejs

# dotls
npm install -g dot-language-server

# luals
brew install lua-language-server

# terraformls
brew install hashicorp/tap/terraform-ls

# gopls
go install golang.org/x/tools/gopls@latest

# java-language-server
## Need to install manually, Please see https://github.com/georgewfraser/java-language-server 
```
