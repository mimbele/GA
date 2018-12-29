function main
    clc, clear;
    %generate 20 random gene
    A = zeros(20,4,1);
    B = zeros(20,1);
    minb=1;
    maxb=100;
    
    for i=1:20
        A(i,1,1) = rand*(maxb-minb)+minb;
        A(i,2,1) = rand*(maxb-minb)+minb;
        A(i,3,1) = rand*(maxb-minb)+minb;
        A(i,4,1) = rand*(maxb-minb)+minb;
        B(i,1) = fn(A(i,1,1),A(i,2,1),A(i,3,1),A(i,4,1));
    end
    
    pp=0.2;
    p=0.022;
    c=20;
        
    for i=1:1000
        %we don't use this:
        %[A(:,:,i+1),B(:,i+1)] = newGeneration(A(:,:,i),B(:,i),i);
        %because new generation may be more than 20 size and we don't want
        %that
        if i>100 && rem(i,50)==0
            if B(1,i)-B(1,i-100) < 20
                pp=0.3;
                p=0.5;
                c=30;
            end
            if i>300
                if B(1,i)-B(1,i-300) < 50
                    pp=0.4;
                    p=0.1;
                    c=50;
                end
            end
        end
        [h,k]= newGeneration(A(:,:,i),B(:,i),maxb,minb,pp,p,c);
        A(1:20,:,i+1)=h(1:20,:);
        B(1:20,i+1)=k(1:20);
        
    end
    %best of the last generation
    plot(1:1001,B(1,1:1001));
    
    B(1,1001)
end