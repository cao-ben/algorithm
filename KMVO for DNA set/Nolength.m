function Nolength = Nolength(DNASet) 

for p = 2:size(DNASet,2)
   
         if DNASet(p-1) == DNASet(p)
             Nolength=1;
             break;
             
         else
             Nolength=0;
         end
     
 end
