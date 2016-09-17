# Lukscrypter docer container

Creates encrypted volume file and gives mapper device as a result.

## Usage

First create container with encrypted file inside. 

```bash
docker run -it --name lukscrypter_data skopciewski/lukscrypter create 1G
```

Then start or stop devie assigned to that volume.

```bash
docker run -it --rm --volumes-from lukscrypter_data --privileged skopciewski/lukscrypter start
docker run -it --rm --volumes-from lukscrypter_data --privileged skopciewski/lukscrypter stop
```

## Available commands and params for entrypoint

For command:
* `create`: `<size> [<cryptsetup params>]`
* `start`: `[<device_name>] [<cryptsetup params>]`
* `stop`: `[<device_name>]`

### Escape to

If you want to execute other command, run docker container with `escto` as first param:

```bash
docker run -it --rm --volumes-from lukscrypter_data --privileged skopciewski/lukscrypter escto bash
```

## Dependencies and requirements

Optionally, you can set `VOLUME_DIR` and `VOLUME_NAME` env vars to customize the volume file path.
Use `-v <your dir for storing volume>:<VOLUME_DIR>` to store volume file on host.

