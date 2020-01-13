
INTELHOME=/opt/intel/2019_up5/impi/2019.5.281/intel64
GCCHOME=/opt/gcc/9.2.0
#/opt/gcc/9.2.0/include/c++/9.2.0
ifeq ($(CC),gcc)
	#FTN=mpif90
	FTN=gfortran
	CC=g++
	MPFTN=mpif90
	COMPHOME=$(GCCHOME)
	FFLAGS=-Wall -g
	CXX = g++
else ifeq ($(CC),icc)
	FTN=ifort
	CC=icc
	MPFTN=mpiifort
 	COMPHOME=$(INTELHOME)
 	FFLAGS=-stand f18 -g -warn
 	CXX=icc
 	CFLAGS=-Wall
endif
LDFLAGS = -lstdc++

INCLUDE= -I$(COMPHOME)/include/c++/9.2.0


all: test_hmap
##test_hmap.o : dm_hmap_mod.o dm_hmap_interface_mod.o

test_hmap :  DMHashMapCFuncs.o DMHashMap.o dm_hmap_mod.o dm_hmap_interface.o 
	${FTN} ${FFLAGS} $(INCLUDE) $(LDFLAGS) $(l) $^ test_hmap.F90 -o $@
	
#%.x : %.o dm_hmap_mod.o DMHashMap.o dm_hmap_interface_mod.o
#	${FTN} $^ -o  $@  ${FFLAGS} $(LDFLAGS)
	
dm_hmap_interface.o: 
	$(FTN) $(FFLAGS) -c $^ dm_hmap_interface.F90
	
dm_hmap_mod.o:  dm_hmap_interface.o
	$(FTN) $(FFLAGS) -c $^  dm_hmap_mod.F90
	
DMHashMapCFuncs.o:
	$(CXX) $(INCLUDE) ${CFLAGS} -c $^  DMHashMapCFuncs.cpp

DMHashMap.o:
	$(CXX)  $(INCLUDE) $(CFLAGS) -c $^  DMHashMap.cpp

clean :
	${RM} -rf *.o *.mod test.x
