Docker image with Firebird 2.5 Superserver
==========================================

_Based on [jacobalberty/firebird-docker](https://github.com/jacobalberty/firebird-docker)_

Contains Firebird 2.5.4 with Superserver architecture.

**SYSDBA** password is set to `masterkey`.

Usage
-----

    $ docker run -d -p 3050:3050 -v /sqlbase:/sqlbase atnurgaliev/firebird2.5

License
-------

BSD
