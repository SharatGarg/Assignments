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

#For Newton's Square Method, we set f(x) = x^2 - a and find zeroes to that
function f1(x::Float64)
    return x^2 - 7.0
end

#For Newton's Square Method, we set f(x) = x^2 - a and find zeroes to that
function f2(x::Float64)
    return x^3 - 7.0
end

#Testing
tangent(f2, 2.0, 20)