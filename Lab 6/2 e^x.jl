#use horner's method for evaluating e^x

function horner_e(x::Float64, n::Int64)
    if n == 0
        return 1
    else
        sum = x/factorial(n)
        for i in n:-1:2
            sum = (sum + 1/factorial(i-1))*x
        end
        return sum + 1
    end
end

horner_e(1., 0)