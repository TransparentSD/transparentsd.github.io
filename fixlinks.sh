#!/usr/bin/env bash
# Remove Joplin notebook folder prefix from exported links
find . -name '*.md' -print0 | xargs -0 sed -i 's#../TransparentSD/##g'
find . -name '*.md' -print0 | xargs -0 sed -i 's#TransparentSD/##g'
