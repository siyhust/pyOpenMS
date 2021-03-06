from Peak1D cimport *
from Feature cimport *
from FeatureMap cimport *
from MSExperiment cimport *
from Peak1D cimport *
from ChromatogramPeak cimport *
from FeatureFinder cimport *
from DefaultParamHandler cimport *

cdef extern from "<OpenMS/TRANSFORMATIONS/FEATUREFINDER/FeatureFinderAlgorithmPicked.h>" namespace "OpenMS":

    cdef cppclass FeatureFinderAlgorithmPicked[PeakT, FeatureT](DefaultParamHandler):

        # wrap-inherits:
        #    DefaultParamHandler
        #
        # wrap-instances:
        #    FeatureFinderAlgorithmPicked := FeatureFinderAlgorithmPicked[Peak1D, Feature]

        FeatureFinderAlgorithmPicked()      nogil except +

cdef extern from "<OpenMS/TRANSFORMATIONS/FEATUREFINDER/FeatureFinderAlgorithmPicked.h>" namespace "OpenMS::FeatureFinderAlgorithmPicked<OpenMS::Peak1D,OpenMS::Feature>":

    String getProductName()   nogil except + # wrap-attach:FeatureFinderAlgorithmPicked
