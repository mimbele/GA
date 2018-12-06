function main
    clc, clear;
    %generate 20 random gene
    A = zeros(20,4,1);
    B = zeros(20,1);
    
    for i=1:20
        A(i,1,1) = rand*30+10;
        A(i,2,1) = rand*50-10;
        A(i,3,1) = rand*10+50;
        A(i,4,1) = rand*40+30;
        B(i,1) = fn(A(i,1,1),A(i,2,1),A(i,3,1),A(i,4,1));
    end

    
    for i=1:100
        %we don't use this:
        %[A(:,:,i+1),B(:,i+1)] = newGeneration(A(:,:,i),B(:,i),i);
        %because new generation may be more than 20 size and we don't want
        %that
        [h,k]= newGeneration(A(:,:,i),B(:,i));
        A(1:20,:,i+1)=h(1:20,:);
        B(1:20,i+1)=k(1:20);
        
        
        
    end
    
    %best of the last generation
    B(1,101)
end