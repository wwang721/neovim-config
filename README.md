# An introduction to Neovim

*Vim* is a popular and lightweight editor available across platforms. I previously used and configured it on my old Mac, but encountered difficulties transferring the setup to a remote machine -- especially when the server lacks internet access or I don't have `sudo` privileges.

I recently came across [**Neovim**](https://neovim.io/), a more modern and easier-to-deploy version of the *Vim*-based text editor. Below are my *Neovim* configurations.

# Install Neovim

Installing **Neovim** on Windows or macOS is straightforward -- refer to the [official documentation](https://github.com/neovim/neovim/blob/master/INSTALL.md) for details

On Linux, you can either use [pre-built archives](https://github.com/neovim/neovim/blob/master/INSTALL.md#pre-built-archives-2) if you have `sudo` privileges, or install via [AppImage](https://github.com/neovim/neovim/blob/master/INSTALL.md#appimage-universal-linux-package) ("universal" Linux package) for a portable, permission-free setup.


For example, since I don’t have superuser privileges on the remote server, I prefer to install Neovim locally. This can be done with the following steps:
``` sh
# Download Neovim 0.9 AppImage (I don't recommend older versions)
curl -LO https://github.com/neovim/neovim/releases/download/v0.9.1/nvim.appimage
chmod u+x nvim.appimage
./nvim.appimage
```
You should see a plain editor that looks just like Vim. Since Neovim follows the [**XDG (X Desktop Group) base directory specification**](https://wiki.archlinux.org/title/XDG_Base_Directory), you only need to:
``` sh
mkdir ~/.local/opt/nvim
mv nvim.appimage ~/.local/opt/nvim/nvim
```
Then, add `export PATH="$PATH:$HOME/.local/opt/nvim/"` to your shell config (e.g., `~/.bashrc` and reload your shell by `source ~/.bashrc`). You should now be able to use `nvim` from anywhere in the terminal.


# Plugins

As mentioned earlier, **Neovim** follows the **XDG base directory specification**, so user-specific configurations should be placed in `~/.config/nvim/`. You can copy your `.vimrc` content into an `init.vim` file within this folder. However, *Neovim* also supports configuration using [**Lua**](https://www.lua.org/), which offers more flexibility and performance.

I am using [**folk/lazy.nvim**](https://github.com/folke/lazy.nvim) as my **plugin manager**.  The configuration file structure is as follows:
```
~/.config/nvim
├── lua
│   ├── config
│   │   ├── autocmds.lua
│   │   ├── keymaps.lua
│   │   ├── lazy.lua
│   │   └── options.lua
│   └── plugins
│       ├── plugin1.lua
│       ├── **
│       └── plugin2.lua
└── init.lua
```
Refer to the [official documentation](https://lazy.folke.io/) for a detailed explanation.

You can even use [**LazyVim**](https://www.lazyvim.org/), a pre-configured Neovim setup powered by the same plugin manager `lazy.nvim`, which eliminates the need to manage plugins manually. However, I find `LazyVim` a bit too heavy for my needs, so here is my minimal plugin list:

* [**vim-airline/vim-airline**](https://github.com/vim-airline/vim-airline): status/tabline
* [**nvim-tree/nvim-tree.lua**](https://github.com/nvim-tree/nvim-tree.lua): file explorer tree
* [**echasnovski/mini.pairs**](https://github.com/echasnovski/mini.pairs): character pairing
* [**numToStr/Comment.nvim**](https://github.com/numToStr/Comment.nvim): smart comment
* [**lukas-reineke/indent-blankline.nvim**](https://github.com/lukas-reineke/indent-blankline.nvim): indent guides
* [**ojroques/nvim-osc52**](https://github.com/ojroques/nvim-osc52): system clipboard

> Note: `nvim-tree` needs a **Nerd Font** to show file icons, you can download them [here](https://www.nerdfonts.com/font-downloads). I installed `MesloLGS Nerd Font`/`CaskaydiaMono Nerd Font` as my terminal fonts.

Neovim has a built-in **Language Server Protocol (LSP)** client. If you want autocompletion, you'll need:

* [**hrsh7th/nvim-cmp**](https://github.com/hrsh7th/nvim-cmp): autocompletion engine
* [**williamboman/mason.nvim**](https://github.com/williamboman/mason.nvim): LSP server managers for different programming languages
* [**neovim/nvim-lspconfig**](https://github.com/neovim/nvim-lspconfig): easy LSP setup
* [**stevearc/aerial.nvim**](https://github.com/stevearc/aerial.nvim): code outline/taglist window

> My understanding of how this works: Although Neovim includes a built-in LSP client, it still requires an external, language-specific LSP server to parse files and provide diagnostics or semantic information. `mason.nvim` manages and installs these servers, while `nvim-lspconfig` configures and connects them to the LSP client. Plugins like `nvim-cmp` (for autocompletion) and `aerial.nvim` (for code outline/taglist) then consume the data exposed by the LSP client.

I chose not to use some famous plugins like [**coc.nvim**](https://github.com/neoclide/coc.nvim) and [**nvim-treesitter**](https://github.com/nvim-treesitter/nvim-treesitter), as I prefer a lightweight editor that launches quickly.

If you don't need autocompletion or the outline/taglist window -- or if you're only using non-*Node.js*-based LSP servers (such as `clangd` for C++) or already have `Node.js` installed -- you can skip the next section.


## Install Node.js

[**Node.js**](https://nodejs.org) is a JavaScript runtime environment, and `npm` (Node Package Manager) is its associated package manager.

Since `mason.nvim` uses `npm` to install LSP servers (e.g., `pyright` for Python), and `npm` typically comes bundled with `Node.js`, we need to install them.

If you have superuser privileges, you can simply run `sudo apt install npm` on Ubuntu (though not recommended as you may get an outdated version of Node.js).  Alternatively, you can install `npm` locally using `nvm` (Node Version Manager), which allows you to manage Node.js versions without requiring `sudo` access:
``` sh
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
```
This will automatically append the following lines to your shell configuration file (e.g., `~/.bashrc`):
``` sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
```
Then we can install `Node.js` by
``` sh
# Install the long-term-support (LTS) version of Node.js
nvm install --lts
```

Once `npm` and `node` are available, you are ready to install LSP servers using `mason.nvim`.


## Install plugins

If you don't need autocompletion and the outline/taglist window, or prefer not to install `Node.js`, you can remove the files `cmp.lua`, `mason.lua`, `lsp.lua`, and `aerial.lua` from my [nvim/lua/plugins/](./nvim/lua/plugins/) folder.

Then, copy my [**nvim**](./nvim) folder to your `~/.config/` directory. Launch Neovim by running `nvim`. It will automatically download all required plugins -- done!

Since Neovim follows the **XDG base directory specification**, the downloaded plugins will be stored in `~/.local/share/nvim/` folder.

If your remote server has no internet access, you can configure Neovim on your local machine and then copy the `~/.local/share/nvim/` directory to the remote server using tools like `scp`.

> Note: For the *Node.js*-based LSP servers (e.g., pyright and bashls), you must also transfer your `~/.nvm` directory and manually append the appropriate environment paths for `npm` and `node` to your shell configuration, as described in the previous section.

## Some notes

* `:Lazy` opens the `lazy.nvim` UI, allowing you to sync/clean/restore/... plugins. It also displays the loading time of each plugin, helping you identify candidates for ["lazy-loading"](https://lazy.folke.io/spec/lazy_loading) to improve startup efficiency.

* I have mapped `<F2>` to toggle the file explorer tree and `<F3>` to toggle the outline (taglist) window. You can adjust the window widths in [nvim/lua/plugins/tree.lua](./nvim/lua/plugins/tree.lua) and [nvim/lua/plugins/aerial.lua](./nvim/lua/plugins/aerial.lua).

* `:LspInfo` to check the status of the currently active LSP server.

* `:Mason` opens the UI of `mason.nvim`, where you can view available LSP servers. Move the cursor to the desired server and press `i` to install it. Alternatively, you can edit [nvim/lua/plugins/lsp.lua](./nvim/lua/plugins/lsp.lua) to add the desired servers under the `ensure_installed` list. I have installed three language servers: `pyright` for Python, `clangd` for C++, and `bashls` for Bash.

* With the clipboard plugin [nvim-osc52](https://github.com/ojroques/nvim-osc52), any text yanked (`y`) in visual mode is automatically copied to the system clipboard.

* In normal mode, `gcc` comments the current line; in visual mode, `gc` comments the selected block.

* In visual mode, `>` and `<` function as `Tab` and `Shift+Tab` in VS Code, allowing you to indent or unindent selected code blocks.

