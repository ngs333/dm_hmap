#include "DMHashMap.hpp"

#include <string>
#include <unordered_map>

int DMHashMap::insert(const std::string &s, const int v) {
		//mymap.insert(s, v);
		mymap[std::string(s)] = v ;
		return v;
}
int DMHashMap::find(const std::string &a) {
		//use this if have c++ 17 compiler:
		//auto found = mymap.find(a);
		std::unordered_map<std::string, int>::const_iterator found = mymap.find(a);

		if (found == mymap.end()) {
			return 0; //TODO 0 --> some convention
		} else {
			return found->second;
		}
	}
