#Code for finding zeroes of a polynomial using secant method

#Function defined here (-x^3+x+1=> f(x)=-x^3+1)
function f(x::Float64)
    return x^3-0.3*x^2+0.002522
end

#Defining the secant method
function secant(x1::Float64, x2::Float64, f::Function)
    x3=x2-f(x2)*(x2-x1)/(f(x2)-f(x1))
    while abs(f(x3))>eps(Float32)
        x3=x2-f(x2)*(x2-x1)/(f(x2)-f(x1))
        x1=x2
        x2=x3
    end
    println("Root is ",x3)
end

secant(-99.,99.,f)