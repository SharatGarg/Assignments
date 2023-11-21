#Use three-digit rounding arithmetic to compute approximations to P(2.19) and Q(2.19) where the functions are P(x) = x^3 − 3x^2 + 3x − 1 and Q(x) = ((x − 3)x + 3) x − 1

setprecision(BigFloat, 16) #gives 16 bit = 6 digit precision

function P(x::BigFloat)
    return x^3 - 3x^2 + 3x - BigFloat(1)
end

function Q(x::BigFloat)
    return ((x - BigFloat(3))x + 3)x - BigFloat(1)
end

#Testing
P(BigFloat(2.19))
Q(BigFloat(2.19))