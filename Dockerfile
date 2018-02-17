FROM fedora

RUN dnf update -y
RUN dnf install -y git curl neovim python2-neovim python3-neovim the_silver_searcher
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN ln -s ~/.cargo/bin/* /usr/bin/
RUN rustup update beta
RUN rustup component add rls-preview --toolchain beta
RUN rustup component add rust-analysis --toolchain beta
RUN rustup component add rust-src --toolchain beta
RUN mkdir /workingdir
RUN mkdir /root/.config
RUN mkdir /root/.config/nvim
COPY init.vim /root/.config/nvim
RUN nvim +PlugUpgrade +PlugInstall +UpdateRemotePlugins +qa

#ENTRYPOINT bash

