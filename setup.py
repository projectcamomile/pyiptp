# -*- coding: utf-8 -*-
from setuptools import setup, Extension
from numpy import get_include
import os
import re

_VERSION = None
with open(os.path.join('pyiptp', '__init__.py'), 'r') as f:
    _VERSION = re.search(r'__version__\s*=\s*"([^"]+)"', f.read()).group(1)

assert _VERSION

USE_CYTHON = True
ext = ".pyx" if USE_CYTHON else ".c"

EXT_MODULES = [
        Extension("pyiptp.cython_ubsplclib",
                  sources = ["pyiptp/cython_ubsplclib"+ext,
                             "pyiptp/ubsplclib.c"],
                  include_dirs = [".", get_include()]),
        Extension("pyiptp.defdatastruct",
                  sources = ["pyiptp/defdatastruct"+ext],
                  include_dirs = [".", get_include()]),
        Extension("pyiptp.factoryfunc",
                  sources = ["pyiptp/factoryfunc"+ext],
                  include_dirs = [".", get_include()]),
        Extension("pyiptp.basicfunc",
                  sources = ["pyiptp/basicfunc"+ext],
                  include_dirs = [".", get_include()]),
        ]

if USE_CYTHON:
    from Cython.Build import cythonize
    EXT_MODULES = cythonize(
        EXT_MODULES,
        compiler_directives={"language_level": "3"}
        )

setup(version = _VERSION,
      packages = ["pyiptp"],
      package_data = {"pyiptp": ["*.pxd"]},
      ext_modules = EXT_MODULES,
      zip_safe = False,
      )