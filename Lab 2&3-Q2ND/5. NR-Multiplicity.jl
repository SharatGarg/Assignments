#Defining derivative of function | Alternatively, g(x) could be given as an input
function g(x::Float64)
    h=1e-14 #Roughly 100 times machine epsilon
    return (f(x+h)-f(x))/h 
end

# Newton Raphson Function
function newton(x0::Float64, N::Int64,y::Int64) #y flags if output is to be printed (1 for yes)
    var=0 #Error Code
    t=1 #Iteration Counter
    l=Float64[] #Array to store the difference between two consecutive iterations
    k=1 #Initial guess for multiplicity
    z=Int64[] #Array to store the k values

    #Error Codes 
    # 0 - No Error
    # 1 - Non-Convergent or Iteration Limit Reached
    # 2 - Slope is Zero

    while abs(f(x0))>eps(Float64)
        if g(x0) == 0.
            var=2
            break    
        elseif f(x0)==0
            var=0
            break
        end
        xn = x0 - k*f(x0)/g(x0)
        append!(l,xn-x0)
        if t>=3 
            r=l[t]/l[t-1]
            kn=round(Int,k/(1-r))
            append!(z, kn)   
            if t>=4
                if z[t-2]==z[t-3]
                    k=kn
                end
            end      
        end        
        x0 = xn
        t=t+1                    
        if t>N
            var=1
            break
        end         
    end

#Outputs
if y==1
    if var==0
        println("Root is:", x0, " with multiplicity ", k)
    elseif var==1
        println("Iteration Limit Reached (Possibly Non-Convergent")
    elseif var==2
        println("Slope is Zero. Last estimate was", x0)
    end
end
end

#Starting with an initial approximation p0 = 2, find the root p = 1 of order M = 2 for the function f(x) = (x − 1) ln(x) using accelerated Newton-Raphson algorithm.
    function f(x::Float64)
        return (x-1)*log(x)
    end
    
 newton(2.0, 100, 1)