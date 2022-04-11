git clone --depth 1 --branch stable https://github.com/flutter/flutter.git $HOME/.flutter

flutter precache
flutter config --no-analytics # desativar coleta de dados do google

#flutter config --enable-linux-desktop
#pacman -Sy --needed clang cmake ninja gtk3 pkgconfig xz # depedencias para compilar no archlinux
