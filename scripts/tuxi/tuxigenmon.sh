#!/bin/bash
# by BeyondMagic 16/02/21
# Genmon script to show output of a tuxi question

O="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cat "$O/lecture.tuxi" | tr '\n' ' ' | sed -r "s_Â__gm" | cut -c 1-100
