function [AA,BB]=newGeneration(A,B,g)
    %generates new generation out of the old one(A)
    %A is a 20x4 array A(x1,x2,x3,x4,generation)
    %B is a 20 size array B(i) = (fn (A(i)s), generation)
    %g is num of generation. new generation is g+1
    AA = zeros(20,4);
    BB = zeros(20,1);
    
    
    
    for i = 1:20
        t(i) = round(B(i)/sum(B)*20); % number of each gene in new generation
    end
    counter=0;
    for j=1:20
        if t(j) ~= 0 && counter<20
            for i=1:t(j)
                counter=counter+1;
                AA(counter,1:4)=A(j,1:4);
            end
        end
    end
    
    %cross over
    for i=1:2:19
        i
        [AA(i,1:4),AA(i+1,1:4)]=Cross_over(AA(i,1:4),AA(i+1,1:4),0.25);
        i=i+1;
    end
    
    
    %first gene in new generation is the best gene in the old generation
    maxB = 0;
    maxi = 0;
    for i=1:20
        if B(i)>maxB
            maxB = B(i);
            maxi = i;
        end
    end
    BB(1)= maxB;
    AA(1,1:4) = A(maxi,1:4);
    
    for i=2:20
        BB(i)= fn(A(i,1),A(i,2),A(i,3),A(i,4));
    end
end