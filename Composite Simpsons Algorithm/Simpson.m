function [I] = Simpson(x,y)
%This function will complete the Composite 1/3 Simpon's rule of a function, and
%if the step size of the function is odd, the last step will be completed by the
%trapezoidal rule.
%The function does this by completing a Composite 1/3 Simpon's rule of the function.
%If the function has an odd amount of steps, the function will complete
%the Composite 1/3 rule up until the last even step, and a trapezoidal rule will be
%completed on the last step. However, if there are an even amount of steps,
%no trapezoidal rule is needed.
%x=A vector of the x values of a function
%y=A vector of the y values of a function
%I=The integral of the vector of function values y with respect to x

%% This section eliminates any possible errors

if range(x(2:end)-x(1:end-1))~=0 %The stepsize between each x value must be equally spaced for the function to work
    error('Step size is not equally spaced, therefore the Simpons Rule cannot be applied')
end

if nargin>2 %There must be 2 inputs for the function to work
    error('Must have exactly 2 inputs for the function to work, a vector of both x and y of a function')
elseif nargin<2
    error('Must have exactly 2 inputs for the function to work, a vector of both x and y of a function')
end

if length(x)~=length(y) %The two vectors of x and y must be equal to eachother for the function to work
    error('The length of the two input vectors must be equal length')
end

if rem(length(x),2)==0 %Warns the user that the trapezoidal rule was used on the last step of function
    warning('Trapezoidal Rule will be used on the last step')
    trap=1;
else
    trap=0;
end

%% This section computes the integral of the function

if length(x)==3 %If there are only three values in x vector, the Simpson's 1/3 Rule is applied
    I=(x(1,3)-x(1,1))*((y(1,1))+4*(y(1,2))+(y(1,3)))/6;
    
elseif length(x)>3 && trap==0 %If the length of the vector is greater than 3 and the Trapezoidal Rule is not needed, the Composite 1/3 Simpson's Rule is applied
    i=1;
    odds=0;
    while i<=length(y) %This loop adds up all the odd elements in the y vector
        odds=y(1,i)+odds;
        i=i+2;
    end
    j=2;
    evens=0;
    while j<=length(y) %This loop adds up all the even elements in the y vector
        evens=y(1,j)+evens;
        j=j+2;
    end
    
    n=length(x)-1; %This gives us the amount of steps(n)
    I=(x(1,end)-x(1,1))*(y(1,1)+4*odds+2*evens+y(1,end))/(3*n); %The Composite 1/3 Simpson's Rule
    
else
    i=1;
    odds=0;
    while i<=length(y) %This loop adds up all the odd elements in the y vector
        odds=y(1,i)+odds;
        i=i+2;
    end
    j=2;
    evens=0;
    while j<length(y) %This loop adds up all the even elements in the y vector
        evens=y(1,j)+evens;
        j=j+2;
    end
    
    n=length(x)-1; %This gives us the amount of steps(n)
    I=((x(1,end)-x(1,1))*(y(1,1)+4*odds+2*evens+y(1,end))/(3*n))+((x(1,end)-(x(1,end-1)))*(y(1,end)+y(1,end-1))/2); %The Composite 1/3 Simpson's Rule plus the Trapezoidal Rule
end
end

