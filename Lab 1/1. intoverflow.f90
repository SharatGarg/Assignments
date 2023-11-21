program Q1

! This simple program demonstrates intoverflow
   implicit none

! Type declarations
	real(kind=4):: a,b,c
	a=2147483647
	b=2147483647


! Executable statements
	c=a+b
	print *, c

end program Q1