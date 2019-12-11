function Norunlength = Norunlength(DNASet) 
for p = 1:size(DNASet,1)
     for q = 1:size(DNASet,2)-1
         if DNASet(p,q) == DNASet(p,q+1)
             del_idx(p,:) = p;
         end
     end
 end
 del_idx(del_idx(:,end)==0) = [];
 DNASet(del_idx,:) = [];
 Norunlength=DNASet;