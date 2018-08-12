local home = os.getenv("HOME")
local installPath = pathJoin(
    home, "apps", myModuleName(), myModuleVersion())

local libPath = pathJoin(
    installPath, 'Dist', 'bin', 'x86_r8', 'lib')

setenv('CASSIOPEE', installPath)
setenv('ELSAPROD', 'x86_r8')
setenv('OMP_NUM_THREADS', '4')
prepend_path('PATH', pathJoin(lib, '..'))
prepend_path('LD_LIBRARY_PATH', libPath)
prepend_path('PYTHONPATH', pathJoin(libPath, 'python2.7', 'site-packages'))

whatis('CFD Advanced Set of Services In an Open Python EnvironmEnt')
help([[
Cassiopee (CFD Advanced Set of Services In an Open Python EnvironmEnt) is a set
of Python modules providing advanced services for preparing CFD computations
and post-processing CFD solutions. This is a research software developped by
Onera, the French Aerospace Lab and distributed as free software under GPL3.
Cassiopee is independent of any solver and can be used with any
multiblock/overset structured/unstructured flow solver.  Provided services are
low level functions, that are designed to be used for easily building your own
applications.
]])
