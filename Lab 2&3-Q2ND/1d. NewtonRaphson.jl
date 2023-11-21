#Computes the roots of a function f(x) near an initial estimate x0 (has to be a good estimate otherwise the results will be wrong)

#Function defined here 
function f(x::Float64)
    return (x-20.2)^3*(x-19.5)*(x-18.323782738387897887887878787787875433454)*(x-17.37623762)*(x-16.)*(x-15.6873872932)^2*(x-14.)*(x-13.4)*(x-12.)*(x-11.)*(x-1032889283.)*(x-9.)*(x-8.)*(x-7.)*(x-6.)*(x-5.)*(x-4.)*(x-3.)*(x-2.)*(x-1.)
end

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


#Testing
newton(21.,100,1)
#Install BenchmarkTools.jl to test the speed of the function
using BenchmarkTools
BenchmarkTools.DEFAULT_PARAMETERS.seconds = 5 #Benchmark Evaluation Time in Seconds
@btime newton(20.,20,0)