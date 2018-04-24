program main
    implicit none
    integer (kind = 4) :: N


    integer (kind = 4) :: A(N,N)
    integer (kind = 4) :: b(N)
    integer (kind = 4) :: X(N)
    integer (kind = 4) :: C
    integer (kind = 4) :: I
    integer (kind = 4) :: J

    do I = 1,N
        do J = 1,N
            if(I.NE.J) then
                C = A(I,J)/A(I,I)
                A(:,J) = A(:,J) - C*A(:,I)
                X(J) = X(J) - C*X(I)
                X(I) = X(I) / A(I,I)
                A(:,I) = A(:,I)/A(I,I)
            end if
        end do
    end do



end program main