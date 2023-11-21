#generalised monte carlo

#define your function
function p(x::Float64, y::Float64)
    return 4.0-x^2-y^2
end


# 1. pick N uniformly generated random numbers x in the interval [0, 1) and then calculate average value of function f on these by sum(f(x_i))/N
# 2. multiply by the area of the interval (2D)

# define function for monte carlo method
function monte_carlo(f::Function, N::Int64, a::Float64, b::Float64)
    fbar = 0.
    f2bar = 0.
    for i in 1:N
        x = rand()
        y = rand()
        fbar += f(a+x*(b-a), a+y*(b-a))
        f2bar += f(a+x*(b-a), a+y*(b-a))^2
    end
    return (b-a)^2*fbar/N, sqrt((f2bar/N - (fbar/N)^2))/(N-1)
end

#trial
x,y = monte_carlo(p, 100000, 0., 1.25)
println("Monte Carlo integral of function p with n = 10000 is ", x, " with error ", y)
