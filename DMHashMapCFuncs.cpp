#include "DMHashMap.hpp"
#include "DMHashMap.h"


#include <iostream>
#include <string>


DMHM* create_hmap(){return new DMHashMap();}

void delete_hmap(DMHM* hm){delete hm;}

// The const qualificators maps from the member function to pointers to the
// class instances.
 int hmap_insert(DMHM* hm, const char* s, int c){
	return hm->insert( std::string(s), c);

}

int hmap_find(DMHM* hm, const char* s){
	int res = hm->find ( std::string(s));
	return res;
	return 1;
}
