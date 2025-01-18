#!/usr/bin/env bash

{
  ln -f radare2rc $HOME/.radare2rc
} || {
  echo "erro ao criar link fisico, copiando arquivo ..."
  cp -f radare2rc $HOME/.radare2rc
}
