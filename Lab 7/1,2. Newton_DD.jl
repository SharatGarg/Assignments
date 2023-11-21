#creates Newton's polynomial of degree n-1 from n (In array D) datapoints as a1 + a2(x-x1)+a3(x-x1)(x-x2)+...+an(x-x1)(x-x2)...(x-xn-1)

#dataset generator
function dataarraygen(a::Float64, b::Float64, n::Int64)
    #generates n datapoints between a and b
    D=Array{Float64}(undef, n, 2)
    for i in 0:n-1
        x=a+i*(b-a)/(n-1)
        D[i+1, 1] = x
        D[i+1,2] = cos(x)
    end
    return D
end

#testing
K=dataarraygen(0. , 1.2, 4)

#function for calculating the newton's divided difference matrix

function newton_dd(A::Array{Float64}, x::Float64)
    #we find the symmetric nxn divided difference matrix Z here based on x (A[1]) and y (A[2]) values
    n=size(A,1)    
    Z=zeros(n,n)
    #The first column of Z is the y values. 
    Z[:,1]=A[:,2]
    println(Z)
    for j in 2:n
        for i in j:n
            Z[i,j]=(Z[i,j-1]-Z[i-1,j-1])/(A[i,1]-A[i-j+1,1]) #Based on relative position (value preceding (i,j-1)-value above that(i-1,j-1))/(x (at same level)-x (at level i-j+1: draw and see)
        end
    end
    sum=Z[1,1]#initial value (a0) will not be multiplied by any x so bahar nikaal do
    prod=1
    for i in 2:n #a0 gone already
        prod=prod*(x-A[i-1,1])#for every iteration i, we multiply another (x-x_(i-1))
        sum = sum + Z[i,i]*prod
    end
    return sum
end

newton_dd(K, 1.2)

#plotting
using Plots
plot(x->cos(x), 0, 1.2, label="cos(x)")
plot(x->newton_dd(K,x), 0, 1.2, label="newton_dd")

