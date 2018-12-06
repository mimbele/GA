function [A,B]=Cross_over(A,B,p)
    %crosses over each element of arrays A and B, with probability of p
    %and returns the changed arrays
    [xa,ya]=size(A);
    for i=1:ya
        r=rand;
        if(r<p)
            t=A(i);
            A(i)=B(i);
            B(i)=t;
        end
    end
end