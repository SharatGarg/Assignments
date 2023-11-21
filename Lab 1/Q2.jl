#Compare the results of calculating f(500) and g(500) using six digits and rounding, where f(x) and g(x) are same function defined in two different ways
setprecision(16) do #setprecision(16) sets precision to 16 bits
    function f(x::BigFloat)
        return x*(sqrt(x+BigFloat(1))-sqrt(x))
    end
    
    function g(x::BigFloat)
        return x/(sqrt(x+BigFloat(1))+sqrt(x))
    end
    
    #test function f with 500 as BigFloat
    x=BigFloat(500)
end

f(x)
g(x)