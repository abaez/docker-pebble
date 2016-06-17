# docker-pebble
A direct container as a program of [pebble-tool].

[![twitter][2i]][2p]
[![license][3i]][3p]

### LEGAL NOTE
You must accept the [Pebble Terms of Use][4] and the [SDK License Agreement][5] to use the Pebble SDK.

### DESCRIPTION

The container provides you with an install of [pebble-tool] for you to use as a full environment. As such, it allows for everything you can think of to develope on pebble with the luxury of not actually having to install the sdk(unless you want to) in your local environment.

The entrypoint of the container is written for simple use of the [pebble-tool]:

``` dockerfile
ENTRYPOINT ["/usr/bin/python", "/tool/pebble.py"]
```

### USAGE

The container runs [pebble-tool] as the executable. As such, you need to download the sdk to a local directory if you want to use again. Do note, the container is running under a user:group = **pebble:users**. Meaning if you want to be able to download the sdk locally, you should make the directory mutable by the group **users** or accessible by **others**:

``` bash
chmod g=rwx <chosen local dir>
docker run -it \
    -v <chosen local dir>:/home/pebble/.pebble-sdk \
    abaez/pebble sdk install latest
```

Afterwards, if you want to do a task on a project, you have to mount the `/pebble` directory like so:

``` bash
docker run \
    -v <chosen local dir>:/home/pebble/.peble-sdk \
    -v <path to project>:/pebble \
    abaez/pebble build
```

#### docker-compose

You can achieve all of the above by having a [docker-compose] file to have the configuration:

``` yaml
pebble:
    image: abaez/pebble
    volume:
        <chosen local dir>:/home/pebble/.pebble-sek
        <path to project>:/pebble
```

If following the [docker-compose] route, then all you would need to do is run the commands through compose:

```
docker-compose run pebble sdk install latest
```

And as an added bonus in lazyness, you can alias the docker-compose to `pebble` and run with less typing if you so wish:

``` bash
alias pebble="docker-compose run pebble"
pebble build
```

[pebble-tool]: https://github.com/pebble/pebble-tool
[docker-compose]: https://docs.docker.com/compose/overview/
[2i]: https://img.shields.io/badge/twitter-a_baez-blue.svg
[2p]: https://twitter.com/a_baez
[3i]: https://img.shields.io/badge/license-MIT-green.svg
[3p]: ./LICENSE

[4]: https://developer.getpebble.com/legal/terms-of-use/
[5]: https://developer.getpebble.com/legal/sdk-license/
