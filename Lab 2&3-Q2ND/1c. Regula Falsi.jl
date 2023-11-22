#Code for finding zeroes of a polynomial using regula falsi method

#Function defined here (-x^3+x+1=> f(x)=-x^3+1)
function f(x::Float64)
    return x^3-0.3*x^2+0.002522
end

#Defining the regula falsi method, to print best estimate after n iterations
function regula(a::Float64, b::Float64, f::Function)
    if f(a)*f(b)>0
        println("No root in the given interval")
    else if f(a)==0
        println("Root is ",a)
    else if f(b)==0
        println("Root is ",b)
    else
        c=(a*f(b)-b*f(a))/(f(b)-f(a)) #First estimate, based on where slope of line joining (a,f(a)) and (b,f(b)) crosses x-axis
        while abs(f(c))>eps(Float32)
            c=(a*f(b)-b*f(a))/(f(b)-f(a))
            if f(a)*f(c)<0
                b=c
            else
                a=c
            end
        end
        println("Root is ",c)
    end
end
    
regula(-99.,99.,f)
