#Code for finding zeroes of a polynomial using iterative method

#Function defined here (-x^3+x+1=> f(x)=-x^3+1)
function f(x::Float64)
    return x^3-0.3*x^2+0.002522
end

#Define function here (x(n+1)=f(x(n)))
function fp(x0::Float64, f::Function, N::Int64)
x = x0
for i in 1:N
    x = f(x)
end
println("Root is:", x)
end
f(1.)
fp(1.,f,10)

