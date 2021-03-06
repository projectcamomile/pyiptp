<div align="center">
  <img src="pyiptplogo.svg"><br>
</div>

-----------------

# pyIPTP - IsoParametric Trajectory Planning python toolkit
## What is it?
**pyIPTP** is a Python 3 package that provides several tools to design trajectories in the joint space, combining the OOP approach with the feature of imposing arbitrary constraints on n-th derivatives or anti-derivatives using iterative loops. The adopted approach uses univariate B-splines to parameterize trajectory pieces, which are then concatenated to build a piecewise trajectory. Working on a parametric data structure, the tool offers many functions of shape modeling and symbolic calculation by actually describing a small **CAD** for trajectories.  These functions, combined appropriately, define macro-instructions that can be reused in several application cases and with which the trajectory is defined with I/O block logic, thus dividing the entire trajectory planning into simpler problems. Additionally, it has the broader goal of becoming the new standard in electric axis control in **the fields of robotic and industrial automation**.

## Main Features

Some good reasons to use this library are:

* trajectory planning in joints space for robotic applications;
* synthesis and study of automatic machines, such as cam mechanisms or articulated systems;
* dynamic simulation of the mechatronic systems;
* teaching.

## Where to get it
The source code is currently hosted on GitHub [here](https://github.com/projectcamomile/python_iptp).

Binary installers for the latest released version are available at the [Python Package Index (PyPI)](https://pypi.org/project/python-iptp/).

```sh
pip install pyiptp
```
## Dependencies
- [NumPy](https://www.numpy.org)
- [Scipy](https://www.scipy.org)
- [lxml](https://lxml.de/)
- [Matplotlib](https://matplotlib.org/) <span style="color: grey;">(soft dependency)</span>

## Build and install from sources
With the following procedures the package can be built on [Windows](#build-on-windows) and [Linux](#build-on-linux) starting from the source code in the repository. 

If you want to modify the Cython source code and compile the modified version, before building you need to follow to the [developer instructions](#developer-instructions).

We suggest to compile **pyIPTP** using [Anaconda Python 3 distribution](https://www.anaconda.com/products/individual).

First install required dependencies:

```sh
conda install numpy scipy lxml matplotlib
```
If you have modified the Cython source or plan to modify it, go to the next section, otherwise skip directly to the  [Windows](#build-on-windows) or  [Linux](#build-on-linux)  build.

## Developer instructions 

If Cython code has been changed, to compile **pyIPTP** and apply changes you need [Cython](https://cython.org/) in addition to the normal dependencies above. Cython can be installed from [PyPI](https://pypi.org/project/Cython/), or from [Conda](https://docs.conda.io/en/latest/):

```sh
conda install -c anaconda cython
```
As an additional step is  required to change the value of the global variable  **USE_CYTHON**  in  **setup.py** file to True. This will also compile the Cython code.

```Python
USE_CYTHON = True
```

Now proceed to the  [Windows](#build-on-windows) or [Linux](#build-on-linux) section depending on the operating system in use.

## Build on Windows

If you work on Windows, you will  need a C++ compiler. In this regard see [Windows compilers documentation](https://wiki.python.org/moin/WindowsCompilers). We use the [TDM-GCC 10.3.0](https://jmeubank.github.io/tdm-gcc/) compiler.

Additional package are needed to build on Windows:
Install [libpython](https://anaconda.org/anaconda/libpython) and [m2w64-toolchain](https://anaconda.org/msys2/m2w64-toolchain):

```sh
conda install -c anaconda libpython
conda install -c msys2 m2w64-toolchain
```
Now to compile **pyIPTP**, execute the `compile_win64.bat` file in the `python_iptp` directory:

```sh
compile_win64.bat
```
## Build on Linux

On Linux there is no need for additional packages. Proceed with the build with the command:

```sh
python setup.py build_ext -i
```

## Installation

After completing the build you can proceed with the installation with the command:

```sh
python setup.py install
```

## License

[BSD 3](LICENSE)

## All contributors
* Marco Riboli, Fabio Corradini [core]
* Marco Silvestri, Rinaldo Garziera [conceptualization]
* Alessandra Aimi [B-splines mathematical background]

## Contributing to pyIPTP

All contributions, bug reports, bug fixes, documentation improvements, enhancements and ideas are welcome. Feel free to ask questions on [info@camomile.dev](info@camomile.dev).
