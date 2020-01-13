! C functions declaration
module dm_hmap_interface
use, intrinsic :: iso_c_binding
implicit none

interface
    function create_hmap_c() bind(C, name="create_hmap")
        use, intrinsic :: iso_c_binding
        type(c_ptr) :: create_hmap_c
    end function create_hmap_c

    subroutine delete_hmap_c(map) bind(C, name="delete_hmap")
        use, intrinsic ::  iso_c_binding
        type(c_ptr), value :: map
    end subroutine delete_hmap_c

    subroutine hmap_insert_c(map, str, val, res)  bind(C, name="hmap_insert")
        use, intrinsic :: iso_c_binding
       ! type (c_int) :: hmap_insert_c !!  or use result keyword
        type(c_ptr), value :: map !! TODO: intent in ?
        character(len=1, kind=C_CHAR), intent(in):: str(*)
        integer(c_int), intent(in), value :: val
        integer (c_int), intent(inout) :: res
    end subroutine hmap_insert_c


!    function hmap_find_c(map, str) result (res) bind(C, name="hmap_find")
 !       use intrinsic, iso_c_binding
 !       implicit none
 !       type(c_ptr), value :: map
!        character(len=1, kind=C_CHAR) , intent(in) :: str(*)
!       integer(c_int):: res
!    end function

    integer(kind=c_int) function hmap_find_c (map, arg) bind(C,name="hmap_find" )
     use, intrinsic :: iso_c_binding
     type(c_ptr), intent (in), value :: map
       character(len=1, kind=C_CHAR) , intent(in) :: arg(*)
     end function hmap_find_c
end interface
end module dm_hmap_interface
