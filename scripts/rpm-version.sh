#!/bin/bash
# translate given version to rpm equivalent

if [ $# != 1 ]; then
    echo "Usage: rpm-version versionstring" >&2
    exit 2
fi

# Transform version numbers so that rpm accepts them:
#
# 3.4.2-rc.1            ->  3.4.2~rc.1
# 3.4.2                 ->  3.4.2
# 3.4.2+522-gee98ef356  ->  3.4.2+522.gee98ef356
echo "$1" | sed -e 's/:.*//' | sed -e 's,\(^[^+]\+\)-,\1~,; s,-,.,g'
