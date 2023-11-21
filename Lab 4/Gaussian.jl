#Make augmented matrix 
Z = [
    2.0  5.0  0.0  -4.0  6.0;
   -4.0 -4.0 -3.0   7.0 36.0;
   -6.0 -3.0 -7.0  -6.0 35.0;
   -1.0  2.0 -6.0   5.0 63.0
]

#Gaussian Elimination (Upper Triangular Matrix) code
function gauss(A::Array{Float64})
    n=size(A,1)
    for p=1:n #for each pivot p
        for r=p+1:n #for each row below pivot
            m=A[r,p]/A[p,p] #calculate the ratio
            A[r,p]=0 #eliminate the value below the pivot
            for c=p+1:n+1 #for each column to the right of the pivot, including the new augmented column (hence n+1)
                A[r,c]=A[r,c]-m*A[p,c] #calculate the new value
            end
        end 
    end
    return A 
end

#print the upper triangular matrix in a n
println("Upper Triangular matrix is:")
display(gauss(Z))


#Back Substitution to get the solution
function backsub(A::Array{Float64})
    Z_up=gauss(Z)
    n=size(Z_up,1)
    a=Z_up[1:n, 1:n]
    b=Z_up[1:n,n+1]
    x=zeros(n)
    x[n]=b[n]/a[n,n]
    for k in n-1:-1:1
        sum=0
        for j in k+1:n
            sum=sum+a[k,j]*x[j]
        end
        x[k]=(b[k]-sum)/a[k,k]
    end
    return x
end

#print the solution
display(backsub(Z))


