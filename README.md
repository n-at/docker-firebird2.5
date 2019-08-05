Docker image with Firebird 2.5 Superserver
==========================================

_Based on [jacobalberty/firebird-docker](https://github.com/jacobalberty/firebird-docker)_

Contains Firebird 2.5 with Superserver architecture.

**SYSDBA** password is set to `masterkey` by default. 
If you want to change this password, use build arg:

    docker build -t firebird --build-arg SYSDBA_PASSWORD=test .

Usage
-----

    $ docker run -d \
        -p 3050:3050 \
        -v /sqlbase:/sqlbase \
        --name firebird \
        atnurgaliev/firebird2.5

License
-------

BSD
