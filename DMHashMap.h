#ifdef __cplusplus
extern "C" {
    class DMHashMap;
    typedef DMHashMap DMHM;
#else
    // Use an opaque pointer from the C side
    typedef struct DMHM DMHM;
#endif

DMHM* create_hmap();

void delete_hmap(DMHM* hm);

// The const qualificators maps from the member function to pointers to the
// class instances.
int hmap_insert(DMHM* hm, const char* s, int c);

int hmap_find(DMHM* hm, const char* s);

#ifdef __cplusplus
}
#endif

