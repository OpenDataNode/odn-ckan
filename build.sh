#!/bin/bash
BUILD_SUFFIX=$1
# if BUILD_SUFFIX is not null
if [ -n "$BUILD_SUFFIX" ]; then
        # replace line in changelog e.g. "odn-ckan (2.2.1-odn0.10.1)" into "odn-ckan (2.2.1-odn0.10.1~rc5)" if rc5 has been set 
        find debian -name \*changelog -type f | xargs sed -i -r '1s/^([a-z,A-Z,\-]+) \(([0-9.]+-odn[0-9.]+).*\)/\1 (\2~'${BUILD_SUFFIX}')/'
fi

fakeroot debian/rules clean binary
