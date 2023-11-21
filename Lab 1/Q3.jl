#Compare the results of calculating f1(0.01) and P(0.01) using six digits and rounding, where f(x) and P(x) are same function defined in two different ways

setprecision(BigFloat, 16) #gives 16 bit = 6 digit precision

function f1(x::BigFloat)
    return (exp(x)-BigFloat(1)-x)/x^2
end

function P(x::BigFloat)
    return BigFloat(0.5)+x/BigFloat(6)+x^2/BigFloat(24)
end

#Testing
f1(BigFloat(0.01))
P(BigFloat(0.01))