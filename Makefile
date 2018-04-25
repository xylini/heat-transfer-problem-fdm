all: precise4 precise8 precise16

precise4:
	ifort -std08 -fpp -D"PRECISION=4" heat-equation-solution.f90 -o "hes4"

precise8:
	ifort -std08 -fpp -D"PRECISION=8" heat-equation-solution.f90 -o "hes8"

precise16:
	ifort -std08 -fpp -D"PRECISION=16" heat-equation-solution.f90 -o "hes16"
