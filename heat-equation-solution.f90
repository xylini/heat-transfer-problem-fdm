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
        integer, intent(in) :: N
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
    real(kind = 16) :: epsilon

    call get_command_argument(1, value)
    call str2int(value,N)

    allocate(A(N,N))
    allocate(X(N))
    A(:, :) = 0
    X(:) = 0
    X(N) = 1
    h = 1./N
    P1 = 1 / (h * h)
    P2 = -2 / (h * h)

    do I = 1,N
        if (I /= N) then
            A(I,I+1) = P1
        end if
        if (I /= 1) then
            A(I,I-1) = P1
        end if
        A(I,I) = P2
    end do


    epsilon = 0

    call eliminate(A,X,N)

    do I = 1,N
        epsilon = epsilon + abs(X(I) - real(i)/real(N))
    end do
    epsilon = epsilon / (N-2)

    write(*,*) epsilon
    write(*,*) X


    deallocate(A)
    deallocate(X)



end program main