program test_hmap
    use dm_hmap_mod, only: dm_hash_map
!    use dm_hmap_interface

    implicit none

    type(dm_hash_map) :: hm
    integer :: val


    hm = dm_hash_map()

    val = hm%insert("h", 5)
    val = hm%insert("a", 2)
    val = hm%insert("z", 9)
    val = hm%insert("Y", 8)

   val =  hm%find("Y")
   write(*,*) "find(Y)=", val
   val =  hm%find("K")
   write(*,*) "find(K)", val
   val =  hm%find("a")
   write(*,*) "find(a)=", val
   val =  hm%find("e")
   write(*,*) "find(e)", val

    call hm%delete

end program
