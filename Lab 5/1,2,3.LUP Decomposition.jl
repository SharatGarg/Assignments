#Define the matrices A and B (in Ax=B)
A= [1. 2. 6.;
    4. 8. -1;
    -2 3 5]
OG=A
B = [6.0;
    36.0;
    35.0;
    63.0]
   

#The LU Decomposition function, which convert the Ax=B problem into T1T2..Tn*Ux=T1T2..Tn*B problem 
#wherein the transformations (done by a series of T matrices) are simultaneously performed on the B matrix
#converting A to Upper Triangular and B to lower Triangular (T....A is U and T....B is M*B). 
#Read more about this here: https://mathweb.ucsd.edu/~mlicht/wina2021/pdf/lecture06.pdf
#You'll see M is invertible, such that M=L^-1, and L is lower triangular, implying (taking L to other side)
#L*Ux=B, implying LU=A. This is the LU Decomposition.
#L can be directly computed by replacing all pth elements of all row r below the pivot with the ratio m.
using LinearAlgebra

#create pivoting function to maximise diagonal elements by swapping rows
function pivot(A::Array{Float64})
    n=size(A,1)
    P=Matrix{Float64}(I,n,n) #create a permutation matrix
    for p in 1:n
        for r=p+1:n #for each row below pivot
            if A[r,p]>A[p,p] #if the element below the pivot is greater than the pivot
                #swap the rows (p is the pivot row and r is the row with the greater element)
                temp=A[p,:]
                A[p,:]=A[r,:]
                A[r,:]=temp
                #swap the rows by changing the permutation matrix
                temp2=P[p,:]
                P[p,:]=P[r,:]
                P[r,:]=temp2
                break #break the loop
            end
        end
    end
    return A,P
end

A_p,P=pivot(A)
display(A_p)
display(P)
function decomp(U::Array{Float64})
    n=size(U,1)
    L = zeros(n,n)
    for p=1:n #for each pivot p        
        L[p,p]=1 #convert matrix to identity matrix
        for r=p+1:n #for each row below pivot
            m=U[r,p]/U[p,p] #calculate the ratio
            L[r,p]=m #replace the pth element of row r with the ratio
            U[r,p]=0 #eliminate the value below the pivot
            for c=p+1:n #for each column to the right of the pivot
                U[r,c]=U[r,c]-m*U[p,c] #calculate the new value for A (Now Upper Triangular)

            end
        end 
    end
    return U,L
end

A_p,P=pivot(A)

U,L= decomp(A_p)

#print the results
println("Upper Triangular matrix is:")
display(U)
println("Lower Triangular matrix is:")
display(L)
println("Product is :")
M=L*U
display(M)
println("Permutation matrix is:")
display(P)
println("OG was :")
OG
C=P*OG
display(C) 
println("super OG (non-permuted) was:")
display(A)