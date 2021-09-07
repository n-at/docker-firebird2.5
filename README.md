Docker image with Firebird 2.5 Super Classic
============================================

_Based on [jacobalberty/firebird-docker](https://github.com/jacobalberty/firebird-docker)_

Contains Firebird 2.5 with Super Classic architecture.

**SYSDBA** password is set to `masterkey` by default.

Usage
-----

Build:

```bash
$ docker image build -t firebird:super-classic .
```

Run:

```bash
$ docker run -d \
    -p 3050:3050 \
    -v /sqlbase:/sqlbase \
    -e SYSDBA_PASSWORD=abacaba \
    --name firebird \
    firebird:super-classic
```

License
-------

BSD
