#Computes the roots of a function f(x) in the interval [a,b], by locating zeroes in smaller intervals within [a,b]. 

#Function defined here (Wilkinson Type)
function f(x::Float64)
    return (x-20.2)*(x-19.5)*(x-18.323782738387897887887878787787875433454)*(x-17.37623762)*(x-16.)*(x-15.6873872932)^2*(x-14.)*(x-13.4)*(x-12.)*(x-11.)*(x-1032889283.)*(x-9.)*(x-8.)*(x-7.)*(x-6.)*(x-5.)*(x-4.)*(x-3.)*(x-2.)*(x-1.)
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

#Testing
bisection(-991e-1,991e-1,1e-3)
using BenchmarkTools
BenchmarkTools.DEFAULT_PARAMETERS.seconds = 5 #Benchmark Evaluation Time in Seconds
@btime bisection(-991e-1,991e-1,1e-3) #This takes time to evaluate since it takes multiple measurements
