from libcpp.string cimport string as libcpp_string
from libcpp.vector cimport vector as libcpp_vector
from libcpp.set cimport set as libcpp_set
from libcpp cimport bool
from DataValue cimport *
from String cimport *
from StringList cimport *


cdef extern from "<OpenMS/DATASTRUCTURES/Param.h>" namespace "OpenMS":

    cdef cppclass Param:
         Param() nogil except +
         Param(Param) nogil except +
         bool operator==(Param) nogil except +
         void setValue(String key, DataValue val, String desc, StringList tags) nogil except +
         void setValue(String key, DataValue val, String desc) nogil except +
         DataValue getValue(String key) nogil except +
         int exists(String key) nogil except +

         void addTag(String key, String tag) nogil except +
         void addTags(String key, StringList tags) nogil except +
         int hasTag(String key, String tag) nogil except +
         StringList getTags(String key) nogil except +
         void clearTags(String key) nogil except +

         libcpp_string getDescription(String key) nogil except +
         void setSectionDescription(String key, String desc) nogil except +
         libcpp_string getSectionDescription(String key) nogil except +

         int size() nogil except +
         void insert(String prefix, Param param) nogil except +
         Param copy(String prefix, bool) except +
         Param copy(String prefix) except +
         void update(Param p_old, bool report_new_params, bool only_update_old) nogil except +

         void setValidStrings(String key, libcpp_vector[String] strings) nogil except +
         void setMinInt(String key, int min) nogil except +
         void setMaxInt(String key, int max) nogil except +
         void setMinFloat(String key, double min) nogil except +
         void setMaxFloat(String key, double max) nogil except +

         void store(String filename) nogil except +
         void load(String filename) nogil except +

         ParamEntry getEntry(String) nogil except +


         ParamIterator begin() nogil except + # wrap-ignore
         ParamIterator end()   nogil except + # wrap-ignore


cdef extern from "<OpenMS/DATASTRUCTURES/Param.h>" namespace "OpenMS::Param":

    cdef cppclass ParamEntry:

        String name
        String description
        DataValue value
        libcpp_set[String] tags
        libcpp_vector[String] valid_strings
        DoubleReal  max_float
        DoubleReal  min_float
        Int  max_int
        Int  min_int

        ParamEntry() nogil except +
        ParamEntry(ParamEntry) nogil except +
        ParamEntry(String n, DataValue v, String d, StringList t) nogil except +
        ParamEntry(String n, DataValue v, String d) nogil except +

        bool isValid(String) nogil except +
        bool operator==(ParamEntry) nogil except +


cdef extern from "<OpenMS/DATASTRUCTURES/Param.h>" namespace "OpenMS::Param":

         cppclass ParamIterator:
             # wrap-ignore
             #ParamEntry& operator*()
             ParamIterator operator++() nogil except +
             ParamIterator operator--() nogil except +
             String getName() nogil except +
             int operator==(ParamIterator) nogil except +
             int operator!=(ParamIterator) nogil except +
             int operator<(ParamIterator) nogil except +
             int operator>(ParamIterator) nogil except +
             int operator<=(ParamIterator) nogil except +
             int operator>=(ParamIterator) nogil except +


