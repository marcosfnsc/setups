FROM fedora:latest

RUN dnf install tmux neovim nodejs the_silver_searcher python zsh curl git -y

# rust
#RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# install fzf
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf \
  && ~/.fzf/install --all

RUN git clone --depth 1 https://github.com/marcosfnsc/setups.git \
  && cd setups/nvim && ./setup_nvim.sh \
  && cd ../tmux     && ./setup_tmux.sh \
  && cd ../zsh      && ./setup_zsh.sh

RUN chsh -s $(which zsh)

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
