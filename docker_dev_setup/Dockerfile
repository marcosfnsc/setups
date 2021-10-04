FROM archlinux:latest

RUN sed '/^#\ Misc\ options/a ParallelDownloads\ =\ 5' /etc/pacman.conf

RUN yes | pacman -Sy reflector rsync
RUN reflector -c BR --sort rate -a 6 --save /etc/pacman.d/mirrorlist

RUN yes | pacman -S --needed tmux neovim nodejs the_silver_searcher python zsh curl git

RUN git clone --depth 1 https://github.com/marcosfnsc/setups.git

ENTRYPOINT ["tail"]
CMD ["-f","/dev/null"]
