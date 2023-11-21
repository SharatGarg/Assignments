#Part 1: Hornet's method

function horner_poly(a::Array, x::Float64)
    # a is an array of coefficients of a polynomial
    # x is the value at which the polynomial is to be evaluated

    n = length(a)
    sum = a[n]*x
    #iterate from n to 2 and add the coefficient to the sum
    for i = n:-1:3
        sum = (sum + a[i-1])*x
    end
    return sum + a[1]
end

#Part 2: Horner's method for derivative
function horner_der(a::Array, x::Float64)
    # a is an array of coefficients of a polynomial
    n = length(a)
    sum = (n-1)*a[n]*x
    for i = n:-1:4
        sum = (sum + (i-2)*a[i-1])*x
    end
    return sum + a[2]
end

#Part 3: Horner's method for integral
function horner_int(a::Array, x::Float64)
    # a is an array of coefficients of a polynomial
    n = length(a)
    sum = n*a[n]*x
    for i = n:-1:2
        sum = (sum + a[i-1]/(i-1))*x
    end
    return sum
end

#sample function
a = [1,2,3,4,5]
horner_poly(a,2.)
horner_der(a,2.)
horner_int(a,2.)

#irl check derivative
function t(x::Float64)
    2. +6*x+12*x^2+20*x^3
end

t(2.)