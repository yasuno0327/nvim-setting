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
