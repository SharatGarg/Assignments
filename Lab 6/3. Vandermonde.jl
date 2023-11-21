#Use vandermonde matrix to solve interpolation problem

#Dataset
A=[1. 1.06; 2. 1.12; 3. 1.34; 5. 1.78]
x=A[:,2]

#Function to solve using vandermonde matrix
function van_mat_solv(A::Array{Float64})
    n=size(A,1)
    Z=Array{Float64}(undef,n,n)
    for i in 1:n
        for j in 1:n
        Z[i,j]=A[i,1]^(j-1) 
        end
    end
    x=A[:,2]
    return Z\x    
end

van_mat_solv(A)