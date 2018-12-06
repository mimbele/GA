function A=Mutation(A,p,c)
    %mutates every element of A with the probability of p,
    %by adding a random number in range of (-c,+c) to that element
    %and returns the changed array
    [xa,ya]=size(A);
    for i=1:ya
        r=rand;
        if(r<p)
            random_number = (rand*2*c)-c;
            A(i)=A(i)+ random_number;
        end
    end
end