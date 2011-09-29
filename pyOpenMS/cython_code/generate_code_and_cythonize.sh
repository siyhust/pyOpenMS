#!/bin/sh
echo "generate _pyOpenMS.pyx"
python build_cython_file.py
echo "generate _pyOpenMS.cpp"
cython -X boundscheck=False -X wraparound=False --cplus _pyOpenMS.pyx 
echo "copy _pyOpenMS.cpp"
cp _pyOpenMS.cpp ..
echo "done"