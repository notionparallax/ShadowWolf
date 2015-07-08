import model
import view
import controller
import unittest

suite = unittest.TestSuite()
suite.addTest(unittest.TestLoader().loadTestsFromModule(model))
suite.addTest(unittest.TestLoader().loadTestsFromModule(view))
suite.addTest(unittest.TestLoader().loadTestsFromModule(controller))

unittest.TextTestRunner().run(suite)
