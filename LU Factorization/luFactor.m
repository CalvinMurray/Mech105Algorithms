function [L,U,P] = luFactor(A)
%This function is designed to use LU decompisition with pivoting to
%determine the L, U, and P matrices of a given A matrix.
%Input your coefficient matrix. What will be output is a lower triangular
%matrix made up of the values used in the Gauss elimination, L. U is the
%upper triangular matrix of the equations found after Gauss forward elimination has
%been completed. The P matrix output is the matrix to show the pivoting
%used in the Gauss elimination steps.
%A=coefficient matrix
%L=lower triangular matrix
%U=upper triangular matrix
%P=pivot matrix

%% This section eliminates the errors that can occur while inputting A

if nargin==0
    error('Must input a matrix for A') %Something must be input for A
elseif nargin>1
    error('Only one input is allowed') %No more than one input are allowed for this function
end

row=size(A,1); %Calculates the amount of rows in the input A matrix
column=size(A,2); %Calculates the amount of rows in the input A matrix
if row~=column
    error('A matrix must be a symmetrical matrix') %The input A matrix must have the same amount of rows and columns
end

%% This section presets the P,L and U matrices

P=zeros(row); %Makes a square matrix of all zeros
L=zeros(row); %Makes a square matrix of all zeros
U=A; %The created U matrix is the same as the input A matrix
i=1;

while i<=row %This loop adds ones across the diagonal of the matrix
    P(i,i)=1;
    i=i+1;
end

%% This section checks if pivoting is neccesary

a=abs(A(1,1)); %Finds the absolute value of the first value in the matrix A
b=abs(A(:,1)); %Finds the absolute value of each value in the first column of matrix A
c=max(b); %Finds the max absolute value of the first column of the matrix A
if c>a %This makes the decision if we need to pivot or not
    j=1; %Column
    k=2; %Row
    while k<=row
        d=abs(A(k,j)); %Assigns the absoute value of each of the first values in the first column of Matrix A to variable d
        if d>a %If this value is greater than the first value in the first row, it replaces it with d
            a=d;
            pivotrow=k; %Keeps the row with the greatest first value
            
        end
        k=k+1; %Reiterates the while loop
    end
P([1 pivotrow],:)=P([pivotrow 1],:); %Pivots matrix P
L([1 pivotrow],:)=L([pivotrow 1],:); %Pivots matrix L
U([1 pivotrow],:)=U([pivotrow 1],:); %Pivots matrix U

end
    

%% ELimination
l=1; %Column
m=2; %Row
n=2; %Resets the m variable
while l<column
    while m<=row
        elimfactor=(U(m,l))/(U(l,l)); %Calculates the value to multiply the first row to eliminate the variable
        U(m,:)=U(m,:)-elimfactor*U(l,:); %Replaces the second row with the new calculated row 
        L(m,l)=elimfactor; %Adds the elimfactor to the L matrix
        m=m+1;
    end
    n=n+1;
    m=n; %Resets the m variable
    l=l+1;
        a=abs(U(l,l)); %Finds the absolute value of the first value in the matrix A
        b=abs(U(:,l)); %Finds the absolute value of each value in the first column of matrix A
        c=max(b); %Finds the max absolute value of the first column of the matrix A
            if c>a %This makes the decision if we need to pivot or not
                j=1; %Column
                k=2; %Row
                while k<=row
                    d=abs(U(k,j)); %Assigns the absoute value of each of the first values in the first column of Matrix A to variable d
                        if d>a %If this value is greater than the first value in the first row, it replaces it with d
                            a=d;
                            pivotrow=k; %Keeps the row with the greatest first value
                        end
                    k=k+1; %Reiterates the while loop
                end
    P([l pivotrow],:)=P([pivotrow l],:); %Pivots matrix P
    L([l pivotrow],:)=L([pivotrow l],:); %Pivots matrix L
    U([l pivotrow],:)=U([pivotrow l],:); %Pivots matrix U
            end


end
i=1;
while i<=row %This loop adds ones to the diagonal of the matrix
    L(i,i)=1;
    i=i+1;
end
end

