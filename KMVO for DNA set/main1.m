clear all
Length =8;
d=4;
Universes_no=60;
H_target=d;
count =500;
Max_iteration=500;

lb=0;
ub=3;
dim=10;

newDNA = MVO(Universes_no,Max_iteration,lb,ub,dim,Length,H_target,count);%MVO(Universes_no,Max_iteration,lb,ub,dim);


BestSet = DNAcode2(newDNA);
