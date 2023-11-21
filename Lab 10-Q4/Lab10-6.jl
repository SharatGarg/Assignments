#evaluating valud of pi using monte carlo method

#define function for evaluating pi such that pi = 4*integral(0,r) sqrt(r^2-x^2) dx, but for r=1
function p(x::Float64)
    return sqrt(1. -x^2)
end


# 1. pick N uniformly generated random numbers x in the interval [0, 1) and then calculate average value of function f on these by sum(f(x_i))/N
# 2. multiply by the length of the interval

# define function for monte carlo method
function mctrial(f::Function, N::Int64)
    fbar = 0.
    f2bar = 0.
    for i in 1:N
        x = rand()
        fbar += f(x)
        f2bar += f(x)^2
    end
    return 4*fbar/N, sqrt((f2bar/N - (fbar/N)^2))/(N-1)
end

#trial
println("For N=10000, pi = ", mctrial(p, 9999)[1], " +/- ", mctrial(p, 9999)[2])
