criar, executar entrar no container:
--------------------------
```console
$ docker build -t dev_setup_image .
$ docker run --name dev_setup -d dev_setup_image
$ docker exec -it dev_setup zsh
```

