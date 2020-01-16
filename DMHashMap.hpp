#ifndef DM_HASH_MAP_CPP

#include <string>
#include <iostream>
#include <unordered_map>

/**
  DM Hash Map class.
  A class that contains a std::unordered_map.
  This class is intended to have a corresponding FORTRAN class.
 **/

class DMHashMap {
public:
	//void insert(const std::string &a, const std::string &b, int v);

	DMHashMap(){
		std::cout << "Entering ctor DMHashMap()" << std::endl;
	}
	int insert(const std::string & a, const int v) ;
	int find(const std::string &a);
private:
	std::unordered_map<std::string, int> mymap;
};

#endif
