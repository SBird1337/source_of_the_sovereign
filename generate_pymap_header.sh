#!/bin/sh

HEADER=src/include/pymap_constants.h
echo "#ifndef __PYMAP_CONSTANTS__" > $HEADER
echo "#define __PYMAP_CONSTANTS__" >> $HEADER
for file in src/include/constants/pymap/*.h
do
	base=$(basename -- "$file")
    echo "#include <constants/pymap/$base>" >> $HEADER
done
echo "#endif" >> $HEADER