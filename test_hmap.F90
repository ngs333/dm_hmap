program test_hmap
    use dm_hmap_mod, only: dm_hash_map
!    use dm_hmap_interface

    implicit none

    type(dm_hash_map) :: hm
    integer :: val


    hm = dm_hash_map()

    val = hm%insert("help", 5)
    val = hm%insert("and", 2)
    val = hm%insert("z", 9)
    val = hm%insert("Yes", 8)

   val =  hm%find("Yes")
   write(*,*) "find(Yes)=", val
   val =  hm%find("yes")
   write(*,*) "find(yes)=", val
   val =  hm%find("K")
   write(*,*) "find(K)", val
   val =  hm%find("and")
   write(*,*) "find(and)=", val
   val =  hm%find("an")
   write(*,*) "find(an)=", val
   val =  hm%find("help")
   write(*,*) "find(help)", val

    call hm%delete

end program
