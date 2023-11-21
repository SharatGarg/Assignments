#given n points, the interpolating polynomial is of degree n-1
function inter(A::Float64)
    n=size(A,1)-1
    

end


    
#Generating Input Data (Will give a list of x and y values in an lengthx2 array)
f(x)=cos(x)
A=[]
for i in range(start=0.0,stop=1.2,length=2)
    A=[A;[i f(i)]]
end

#Testing
using Plots
plot(x -> f(x), -9, 9, label = "Original Function")
plot!(t -> lagrange(A,t), -9, 9, label = "Interpolated Function")
