#Simple Newton Raphson algorithm without k
function tangent(f, x0::Float64, N::Int64)
    h=1e-14
    # Defining derivative of function
    function g(x::Float64) 
        return (f(x+h)-f(x))/h #ANALYSE ERROR (CANCELLATION)
    end
    ep=eps(Float64)
    # Newton Raphson Method Function
    println("START NEWTON RAPHSON")
    t=1
    l=Float64[]
    z=Int64[]
    if abs(f(x0))<=ep
        println("Given Point is a Zero")
    else
        while abs(f(x0))>ep
            if g(x0) == 0.
                println("Slope is Zero: Either Given Point is Critical or a Critical Point lies between zero and given")
                var=1
                break
            end     
    
            xn=x0 - f(x0)/g(x0)
            println("Iteration:", t , " x=", xn , " f(x)=" , f(xn), )  
            if xn==x0
                println("Root is:", x0)
                var=1
                break
            end
            d=xn-x0
            append!(l,d)
            x0 = xn
            t=t+1   

            if t>N
                println("Non-Convergent or Iteration Limit Reached")
                break
            end
         end
    end           
end

function bisection(range_lower::Float64,range_upper::Float64,div_size::Float64)
    er=0
    num=(range_upper-range_lower)/div_size
    z=Float64[]
        for n in 1:num
            p1=range_lower+(n-1)*div_size
            p2=range_lower+n*div_size
            if f(p1)*f(p2)<0
                #Root is in the interval
                while (abs(p2-p1))>eps(Float64)
                    p3=p1+(p2-p1)/2. 
                   if f(p3)==0.
                        append!(z,p3)
                        er=1
                        break 
                    end 
                    if f(p1)*f(p3)<0. 
                        p2=p3
                    else
                        p1=p3
                    end                        
                end
                #Final Zero is (p1+p2)/2.
                if er==0
                    append!(z,(p1+p2)/2.) 
                end
            elseif f(p1)*f(p2)==0 
                #Root is on the boundary of the interval
                if f(p1)==0
                    append!(z,p1)
                else
                    append!(z,p2)
                end
            end
        end
    return z
end

##BEGIN QUESTIONS##

#A: Find zero of x^3-3rx^2+4*ρ*r^3 
#Newton Raphson Method shall be used, initial guess of 0.08 shall be used because r = 10
function q3a(x::Float64)
    return x^3-0.3*x^2+0.002522
end
# Newton Raphson Function
tangent(q3a, 0.08, 100)

#C: Find zero of xsinx-1 between 0 and 1 
function f(x::Float64)
    return x*sin(x)-1
end
#we'll use bisection method
bisection(0.,2.,0.0001)

#D: Find zero of x^3-3r*x^2+r^3. Assuming r=0.5 m
function q3d(x::Float64)
    return x^3-1.5*x^2+0.125
end

tangent(q3d, 0.3, 10)
