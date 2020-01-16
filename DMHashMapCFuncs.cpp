#include "DMHashMap.hpp"
#include "DMHashMap.h"


#include <iostream>
#include <string>


DMHM* create_hmap(){
	return new DMHashMap();}

void delete_hmap(DMHM* hm){delete hm;}

int hmap_insert(DMHM* hm, const char* s, int c){
	//printf("%s\n", "hmap_insert start");
	int rv = hm->insert( std::string(s), c);
	//printf("%s\n", "hmap_insert end");
	return rv;

}

int hmap_find(DMHM* hm, const char* s){
	int res = hm->find ( std::string(s));
	return res;
	return 1;
}
