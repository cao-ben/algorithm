function set = updateSet(DNA,d)
[px,py]=size(DNA);
A=RCDisHammingMatrix(DNA);
B=DistHammingMatrix(DNA);
B(logical(eye(size(B))))=d;
B=d-B;
A=d-A;
A(A<0)=0;
B(B<0)=0;
C=A+B;
E=sum(C,1);
len=find(E==0);
if length(len)==0
    index=randi([1 px]);
    set=DNA(index,:);
else
    set=DNA(len,:);
end
end
