function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%This function estimates the root of a given function by using the false
%position method.
%Input:
%func=the function being evaluated
%xl=lower guess
%xu=upper guess
%es=desired relative error
%maxiter=desired number of iterations
%Output:
%root=estimated root location
%fx=function evaluated at root location
%ea=approximate relative error
%iter=amount of iterations performed

%%
%This section eliminates all errors that can occur in the function inputs

if nargin==3
    es=.0001;%Defaults relative error to .0001% if nothing is input
    maxiter=200;%Defaults iterations to 200 if there is no input for it
elseif nargin==4
    maxiter=200;%Accounts for if an error is input but no iteration is
elseif es<=0
    error('Can not have 0 or negative percent error');
elseif maxiter<=0
    error('Can not have 0 or negative iterations')
elseif nargin<3
    error('Must either input at least 3 arguments');%Must input 3 arguments for the function to work
elseif nargin>5
    error('Max amount of inputs is 5');%Max amount of inouts is 5
elseif func==0
    error('Must input a function for this function to work');%Can not input no function
end

if func(xl)*func(xu)>0
    error('The upper and lower bounds do not bracket the root')%This loop gives an error if the upper and lower bounds do no bracket the root
end

%%
%This section is the start of the false position method

ea=100;%This is the starting point for the approximate error
iter=0;%This is the starting point for the amount of iterations performed
while ea>es && iter<maxiter
    root=double(xu-(func(xu)*(xl-xu))/(func(xl)-func(xu)));%False position formula
    if iter==0
        rootold=0;%On the first iteration there is no previous root
    end
    ea=abs((root-rootold)/root)*100;%Calculates the new absolute percent error
    if func(root)*func(xu)>0%This loop figures out if the root is the new upper or new lower bound
        xl=root;
    else
        xu=root;
    end
    iter=iter+1;%Adds a new iteration each loop
    rootold=root;%Keeps the old root to estimate the new approximate error
end
fx=double(func(root));  
end
