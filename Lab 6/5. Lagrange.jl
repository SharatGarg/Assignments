#generalised n degree lagrange polynomial, given n Points

function lagrange(A::Array,x::Float64)
    n=size(A,1)
    L=0
    for i in 1:n
        L=L+A[i,2]*prod([(x-A[j,1])/(A[i,1]-A[j,1]) for j in 1:n if j!=i])
    end
    return L
end
    
#Generating Input Data (Will give a list of x and y values in an lengthx2 array)
f(x)=3x^2+5x+6
A=[]
for i in range(start=-9.0,stop=9.0,length=10)
    A=[A;[i f(i)]]
end

#Testing
using Plots
plot(x -> f(x), -9, 9, label = "Original Function")
plot!(t -> lagrange(A,t), -9, 9, label = "Interpolated Function")
