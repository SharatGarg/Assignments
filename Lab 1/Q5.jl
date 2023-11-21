n=10 #number of iterations
x = zeros(n)
r = zeros(n)
p = zeros(n)
q = zeros(n)


x[1]=1. #correct value 
r[1]=0.99996 #value with induced error 

#compute and store the actual terms in the series 1/3^j from 0 to n, stored in x = [1,1/3 ....]
for j in 2:n
    x[j]=1/(3^(j-1))
end

#recursive relation 1 (doing 1/3rd of the previous term) stored in r = [1,1/3 ....]
for j in 2:n
    r[j]=r[j-1]/3
end

#recursive relation 2 (doing 4/3 of the previous term minus 1/3 of the term before that) stored in p = [1,1/3 ....]
p[1]=1.
p[2]=0.3332

for j in 3:n
    p[j] = (4/3)*p[j-1]-p[j-2]/3
end

#recursive relation 3 (doing 10/3 of the previous term minus the term before that) stored in q = [1,1/3 ....]
q[1]=1.0
q[2]=0.3332

for j in 3:n
    q[j] = (10/3)*q[j-1]-q[j-2]
end

#table of n[j], x[j], n[j], p[n] and q[j] for 1 to n
using DataFrames
df = DataFrame(n=[], Actual=[], ErrorSeries=[], Recursion1=[], Recursion2=[])
for j in 1:n
    push!(df, [j, x[j], r[j], p[j], q[j]])
end
println(df)


#table of n[j], x[j]-r[j], x[j]-p[j] and x[j]-q[j] for 1 to n

#Make a table with headings n, Error in Actual, Error in Recursion 1, Error in Recursion 2

df1 = DataFrame(n=[], ErrorOG=[], ErrorRecurion1=[], ErrorRecursion2=[])
for j in 1:n
    push!(df1, [j, x[j]-r[j], x[j]-p[j], x[j]-q[j]])
end
println(df1)


#Plot the error in the actual value and the error in the recursive relation 1, 2 and 3
using Plots
plot(df1.n, df1.ErrorOG, label="Error in Actual", xlabel="n", ylabel="Error", title="Error in Actual")
plot(df1.n, df1.ErrorRecurion1, label="Error in Recursion 1", xlabel="n", ylabel="Error", title="Error in Recursion1")
plot(df1.n, df1.ErrorRecursion2, label="Error in Recursion 2", xlabel="n", ylabel="Error", title="Error in Recursion2")
