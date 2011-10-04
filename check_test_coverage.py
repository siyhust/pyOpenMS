import numpy
import os
import glob
import pyOpenMS

toTest = set()

ignore = ["numpy", "np"]

for clz_name, clz in pyOpenMS._pyOpenMS.__dict__.items():
    if clz_name in ignore or clz_name.startswith("__"):
        continue

    for method_name, method in clz.__dict__.items():
       
        if method_name.startswith("__") and method_name != "__init__":
            continue
        
        toTest.add("%s.%s" % (clz_name, method_name))

def parse_doc(item, collection):
    if item.__doc__ is not None:
       it = iter(item.__doc__.split("\n"))
       for line in it:
            if "@tests" in line:
                for line in it:
                    line = line.strip()
                    if "@end" in line: 
                        break
                    if not line:
                        continue
                    clz, method = line.split(".")
                    if clz=="":
                        clz = oldclzz
                    collection.add("%s.%s" % (clz, method))
                    oldclzz = clz
                  

def collectRecursed(obj, collection):
    if hasattr(obj, "__dict__"):
        for name, item in obj.__dict__.items():
                if name.upper().startswith("TEST"):
                    parse_doc(item, collection)
                    collectRecursed(item, collection)

declaredAsTested = set()

for p in glob.glob("unittests/test*.py"):
    module_name= p[:-3].replace("/",".").replace(os.sep, ".")

    module = __import__(module_name)
    collectRecursed(module, declaredAsTested)

missing = toTest-declaredAsTested

if missing:
    print
    print len(missing), "tests/test declarations  are missing !"
    if len(missing)>10:
        print "top 10 are:"
    for name in sorted(missing)[:10]:
        print "    ", name

toMuch = declaredAsTested-toTest

if toMuch:
    print
    print len(toMuch), "tests/test declarations do not fit:"
    for name in toMuch:
        print "    ", name