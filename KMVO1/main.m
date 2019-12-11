%_______________________________________________________________________________________%
%  Multi-Verse Optimizer (MVO) source codes demo version 1.0                            %
%                                                                                       %
%  Developed in MATLAB R2011b(7.13)                                                     %
%                                                                                       %
%  Author and programmer: Seyedali Mirjalili                                            %
%                                                                                       %
%         e-Mail: ali.mirjalili@gmail.com                                               %
%                 seyedali.mirjalili@griffithuni.edu.au                                 %
%                                                                                       %
%       Homepage: http://www.alimirjalili.com                                           %
%                                                                                       %
%   Main paper:                                                                         %
%                                                                                       %
%   S. Mirjalili, S. M. Mirjalili, A. Hatamlou                                          %
%   Multi-Verse Optimizer: a nature-inspired algorithm for global optimization          % 
%   Neural Computing and Applications, in press,2015,                                   %
%   DOI: http://dx.doi.org/10.1007/s00521-015-1870-7                                    %
%                                                                                       %
%_______________________________________________________________________________________%

% You can simply define your cost in a seperate file and load its handle to fobj 
% The initial parameters that you need are:
%__________________________________________
% fobj = @YourCostFunction
% dim = number of your variables
% Max_iteration = maximum number of generations
% SearchAgents_no = number of search agents
% lb=[lb1,lb2,...,lbn] where lbn is the lower bound of variable n
% ub=[ub1,ub2,...,ubn] where ubn is the upper bound of variable n
% If all the variables have equal lower bound you can just
% define lb and ub as two single number numbers

% To run MVO: [Best_score,Best_pos,cg_curve]=MVO(Universes_no,Max_iteration,lb,ub,dim,fobj)
%__________________________________________

clear all 
clc

Universes_no=60; %Number of search agents (universes)

Function_name='F2'; %Name of the test function that can be from F1 to F23 (Table 1,2,3 in the paper)
SD=[];
SW=[];
rankSumAll=[];
Max_iteration=500; %Maximum numbef of iterations

%Load details of the selected benchm ark function
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
%  for j=1:200000
for i=1:10
    
    [Best_score,Best_pos,cg_curve]=MVO(Universes_no,Max_iteration,lb,ub,dim,fobj);
    SD=[SD Best_score];
%     if i==1
%         SW=Best_pos;
%     else
%     SW=cat(1,SW,Best_pos);
%     end
%     SW=[SW Best_pos];
    [MVO_old_Best_score,MVO_old_Best_pos,MVO_old_cg_curve]=MVO_old(Universes_no,Max_iteration,lb,ub,dim,fobj);
    SW=[SW MVO_old_Best_score];
%     if i==1
%     SW=MVO_old_Best_pos;
%     else
%     SW=cat(1,SW,MVO_old_Best_pos);
%     end
end
    display(['The AVE/G is : ', num2str(mean(SD))]);
    standard_1=std(SD,0);
    display(['The SD by MVO is : ', num2str(standard_1)]);
    display(['the shoulianquxian1is ',num2str(cg_curve)]);
% if standard_1<177.09
%     break;
% end
% end
%  standard_1=std(SD,0);
% display(['The SD by MVO is : ', num2str(standard_1)]);
% display(['The AVE/G is : ', num2str(mean(SD))]);
% display(['The MAx is : ', num2str(max(SD))]);
% display(['The Min is : ', num2str(min(SD))]);
% display(['The details is : ', num2str(SD)]);
% if(standard_1<2.5)
%     break;
% end
% end
standard_2=std(SW,0);
display(['The SD by MVO is : ', num2str(standard_2)]);
display(['The AVE/G is : ', num2str(mean(SW))]);
display(['The MAx is : ', num2str(max(SW))]);
display(['The Min is : ', num2str(min(SW))]);
display(['The details is : ', num2str(SW)]);
%display(['The SW by MVO is : ', num2str(SW)]);
% for i=1:100
% k1 = randperm(30);
% ranksum1=ranksum(SW(k1(1),:),SW(k1(2),:));
% rankSumAll=[rankSumAll ranksum1];
% 
% end
% for i=1:10
%     for j=i+1:10
%     ranksum1=ranksum(SW(i,:),SW(j,:));
%     rankSumAll=[rankSumAll ranksum1];
%     end
% end
% display(['The MAx is : ', num2str(max(rankSumAll))]);
% display(['The Min is : ', num2str(min(rankSumAll))]);
% display(['The mean is : ', num2str(mean(rankSumAll))]);
figure('Position',[290   206   648   287])

%Draw the search space
subplot(1,2,1);
func_plot(Function_name);
title('Test function F2')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])
grid off
shading interp;
light;
lighting phong;
shading interp;

%Draw the convergence curve
subplot(1,2,2);
semilogy(cg_curve,'Color','r')
hold on
semilogy(MVO_old_cg_curve,'Color','b')
title('Convergence curve')
xlabel('Iteration');
ylabel('Best score obtained so far');

axis tight
grid off
box on
legend('KMVO','MVO')

display(['The best solution obtained by MVO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by MVO is : ', num2str(Best_score)]);

        



