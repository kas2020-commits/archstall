#!/bin/sh

if [ $# -ne 1 ]; then
	echo "Bad input. Exiting..." && exit 1
fi

$1 clang gcc octave python-pip r texlive-most pdftk

