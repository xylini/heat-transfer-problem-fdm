module str2int_mod
contains

    subroutine str2int(str, int)
        implicit none
        character(len=*),intent(in) :: str
        integer,intent(out)         :: int

        read(str,*) int
    end subroutine str2int
end module str2int_mod

#if !defined(PRECISION)
#define PRECISION 8
#endif

module gauss_elimination
    implicit none

contains
    subroutine eliminate (A, X, N)
        implicit none
        integer (kind = 8) :: I, J
        real(kind = PRECISION) :: C
        integer (kind = 8), intent(in) :: N
        real(kind = PRECISION), intent(inout) :: A(N, N), X(N)
        do I = 1,N
            do J = 1,N
                if(I /= J) then
                    C = A(I,J)/A(I,I)
                    A(:,J) = A(:,J) - C*A(:,I)
                    X(J) = X(J) - C*X(I)
                    X(I) = X(I) / A(I,I)
                    A(:,I) = A(:,I)/A(I,I)
                end if
            end do
        end do
    end subroutine eliminate
end module gauss_elimination



program main
    use str2int_mod
    use gauss_elimination
    implicit none
    integer :: precise, N, length, I, J
    character(10) :: value
    real (kind = PRECISION), allocatable :: A(:, :), X(:)
    real (kind = PRECISION)              :: h,P1,P2 !P1 takie samo jak P3 wiec wystarczy jedno

    call get_command_argument(1, value)
    call str2int(value,N)

    allocate(A(N,N))
    allocate(X(N))
    A(:, :) = 0
    X(:) = 0
    X(N) = 1
    h = 1./N
    P1 = 1/(h*h)
    P2 = -2/(h*h)

    A(1,1) = P2
    A(2,1) = P1


    do I = 1,N
        A(I-1,I) = P1
        A(I,I) = P2
        A(I+1,I) = P1
    end do

    call eliminate(A,X,N-1)

    write(*,*) A

end program main