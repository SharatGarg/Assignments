#Linear square fit problems

#Dataset for Q3a (Planet data)
Da=[57.59	87.99;
108.11	224.7;
149.57	365.26;
227.84	686.98;
778.14	4332.4;
1427.0	10759.0;
2870.3	30684.0;
4499.9	60188.0;
5909.0	90710.0]

#Dataset for Q3b (Logdata)
Db=[0. 200.;
1. 400.;
2. 650.;
3. 850.;
4. 950.]

#3a We need to first make a program that can convert y_prime=. This will be stored in a table
function square_loga(A::Array{Float64})
    n=size(A,1)
    Z=Array{Float64}(undef, n , 4)
    for i in 1:n
        Z[i,1]=log(A[i,1])
        Z[i,2]=log(A[i,2])
        Z[i,3]=Z[i,1]^2
        Z[i,4]=Z[i,1]*Z[i,2]
    end
    #Now we need to make the matrix for the normal equations
    L=[sum(Z[:,1]) n; sum(Z[:,3]) sum(Z[:,1])]
    R=[sum(Z[:,2]); sum(Z[:,4])]
    #Now we need to solve the normal equations
    X=L\R
    return X
end

square_loga(Da)

#3b We need to first make a program that can convert y_prime=ln(L/y-1) where L = 1000. This will be stored in a table
function square_logb(A::Array{Float64})
    n=size(A,1)
    Z=Array{Float64}(undef, n , 4)
    for i in 1:n
        Z[i,1]=A[i,1]
        Z[i,2]=log((1000/A[i,2])-1)
        Z[i,3]=Z[i,1]^2
        Z[i,4]=Z[i,1]*Z[i,2]
    end
    #Now we need to make the matrix for the normal equations
    L=[sum(Z[:,1]) n; sum(Z[:,3]) sum(Z[:,1])]
    R=[sum(Z[:,2]); sum(Z[:,4])]
    #Now we need to solve the normal equations
    X=L\R
    return X
end

square_logb(Db)























