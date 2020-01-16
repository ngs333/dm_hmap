program test_hmap
    use dm_hmap_mod, only: dm_hash_map
    use dm_hmap_interface, only : create_hmap_c

    implicit none

    type(dm_hash_map) :: hm
    character(len=:), allocatable :: key
    integer :: val

    !!hm = dm_hash_map() !!Intel does not understand constructors ?
    call hm%init_() !!To be deprecated

    key = "help"
    val = 5
    print *, "test_hmap inserting key,val:", key, ", ", val
    val = hm%insert(key, val)
    key = "and"
    val = 2
    print *, "test_hmap inserting key,val:", key, ", ", val
    val = hm%insert(key, val)
    val = hm%insert("z", 9)
    val = hm%insert("Yes", 8)


    print *, "test_hmap finding Yes"
    val =  hm%find("Yes")
    print *, "find(Yes)=", val
    val =  hm%find("yes")
    print *, "find(yes)=", val
    val =  hm%find("K")
    print *, "find(K)", val
    val =  hm%find("and")
    print *, "find(and)=", val
    val =  hm%find("an")
    print *, "find(an)=", val
    val =  hm%find("help")
    print *, "find(help)", val

    call hm%delete

end program
