#ifndef DM_HASH_MAP_CPP

#include <string>
#include <unordered_map>

/**
  DM Hash Map class.
 **/

class DMHashMap {
public:
	//void insert(const std::string &a, const std::string &b, int v);

	int insert(const std::string & a, const int v) ;
	int find(const std::string &a);
private:
	std::unordered_map<std::string, int> mymap;
};

#endif
