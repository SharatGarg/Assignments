#Create a function f(x) and then integrate

#Given Function
function f(x::Float64)
    return 2. + sin(2*sqrt(x))
end

#Trapezoidal integration function, defined as int = h/2*(f(a)+f(b)+2(fc,d,e,f,...))= h*sum(fx) at all points between a & b + h/2*(fa+fb)
function trap(a::Float64, b::Float64, M::Int64, func::Function)
    h = (b-a)/M #a+nh (n=0 -> a), a+Mh=b
    sum = 0        
    for n in 1:M-1
        sum = sum + func(a+n*h)  
    end   
    return h*sum+h/2*(func(a)+func(b))    
end
    
#Simpson integral function defined as int = h/3*(f1+4f2+f3) for all interval => int = h/3(f1+fn)+2h/3*(f3+f5+f7..)+4h/3(f2+f4+f6..)
function simp(a::Float64, b::Float64, Z::Int64, func::Function)
    M = (Z-1)/2
    h = (b-a)/2M
    sum1 = 0
    sum2 = 0
    for k in 1:M-1
        sum1 = sum1 + func(a+2*k*h)
        sum2 = sum2 + func(a+(2*k-1)*h)
    end
    return 2*(h/3)*sum1 +4*(h/3)*(sum2+func(a+(2*M-1)*h)) +h/3*(func(a)+func(b))
end

#Part a: Trapezoidal rule for 11 points
println("The trapezoidal integral is: ", trap(1.,6.,999, f))
#Part b: Simpson rule for 11 points
println("The simpson integral is: ", simp(1.,6.,999, f))


