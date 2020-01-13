module dm_hmap_mod
    use, intrinsic ::  iso_c_binding
    use dm_hmap_interface, only: hmap_insert_c, hmap_find_c, create_hmap_c, delete_hmap_c

    private
    public :: dm_hash_map

    ! Yes, include is a keyword in Fortran !
    !!include "dm_hmap_interface.F90"

    ! FORTRAN representation of C++ DMHashMap
    type dm_hash_map
        private
        type(c_ptr) :: ptr ! pointer to the hmap class
    contains
        final :: delete_hmap
        procedure :: delete => delete_hmap_poly
        procedure :: insert => hmap_insert
        procedure :: find   =>  hmap_find_o
    end type

    ! The "Constructor"
    interface dm_hash_map
        procedure create_hmap
    end interface

contains
    function create_hmap()
        implicit none
        type(dm_hash_map) :: create_hmap
        create_hmap%ptr = create_hmap_c()
    end function

    subroutine delete_hmap(this)
        implicit none
        type(dm_hash_map) :: this
        call delete_hmap_c(this%ptr)
    end subroutine

    ! Bounds procedure needs to take a polymorphic (class) argument
    subroutine delete_hmap_poly(this)
        implicit none
        class(dm_hash_map) :: this
        call delete_hmap_c(this%ptr)
    end subroutine

    function hmap_insert(this, str, val) result(res)
        implicit none
        class(dm_hash_map), intent(in) :: this
        character(len=*), intent(in) :: str
        integer, intent(in), value :: val
        integer  :: res !!TODO: c_int ?
        !character(len=1, kind=C_CHAR) :: c_str(*)
        character(kind=C_CHAR), dimension(:), allocatable :: c_str
        c_str = fortran_to_c_string (str)
        !res = hmap_insert_c(this%ptr, c_str, val) !TODO: Return val ?
        call hmap_insert_c(this%ptr, c_str, val, res) !TODO: Return val ?
    end function

    function hmap_find_o(this, fstr) result (rval)
        implicit none
        class(dm_hash_map), intent(in) :: this
        character(len=*), intent(in) :: fstr
        integer :: rval !! TODO: c_int!
        !character(len=1, kind=C_CHAR) :: c_str(*)
        character(kind=C_CHAR), dimension(:), allocatable :: c_str
        c_str = fortran_to_c_string (fstr)
        rval = hmap_find_c(this%ptr, c_str)
    end function

!> Make and return a C string from a fortran string
function fortran_to_c_string (fstr) result(res)
    character(len=*), intent(in) :: fstr
    character(len=1, kind=C_CHAR) :: res(len_trim(fstr) + 1)
    integer i, N

    N = len_trim(fstr)
    do i = 1, N
        res(i) = fstr(i:i)
    end do
        res(N + 1) = C_NULL_CHAR
end function fortran_to_c_string

end module
