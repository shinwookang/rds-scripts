%% Synchronization Test
clear all; clc;
t = 100; %time step duration
c_1 = .3; %switching probability between two F_1, F_2 if rand > c_l, F1

%% 4 gene test case 
% n=4; %5th node extension
% varF_1 = [1,1,1,1;2,2,2,2;3,3,3,3;4,4,4,4];
% nv_1 = [4, 4, 4, 4];
% F_1 = [1,1,0,0;
%     1,1,0,0;
%     1,0,1,1;
%     1,1,0,1;
%     1,1,1,0;
%     1,0,1,0;
%     1,1,1,1;
%     0,0,1,1;
%     0,1,0,0;
%     0,0,0,0;
%     0,0,0,1;
%     1,1,0,0;
%     1,0,1,0;
%     0,1,1,0;
%     0,1,1,0;
%     1,0,1,1];
% F_2 = [0,1,0,0;
%     0,1,0,0;
%     1,0,1,1;
%     1,1,0,1;
%     0,1,1,0;
%     0,0,1,0;
%     1,1,1,1;
%     1,0,1,1;
%     0,1,0,0;
%     1,0,0,0;
%     0,0,0,1;
%     1,1,0,0;
%     1,0,1,0;
%     0,1,1,0;
%     0,1,1,0;
%     0,0,1,1];
% initState1 = [0, 0, 1, 1];
% initState2 = [1, 0, 1, 0];

%% 5 gene test case
n=5;
varF_1 = [1,1,1,1,1;2,2,2,2,2;3,3,3,3,3;4,4,4,4,4;5,5,5,5,5];
nv_1 = [4, 4, 4, 4, 5];
F_1 = [1,1,0,0,1;
    1,1,0,0,0;
    1,0,1,1,1;
    1,1,0,1,0;
    1,1,1,0,0;
    1,0,1,0,0;
    1,1,1,1,1;
    0,0,1,1,0;
    0,1,0,0,1;
    0,0,0,0,0;
    0,0,0,1,0;
    1,1,0,0,0;
    1,0,1,0,0;
    0,1,1,0,1;
    0,1,1,0,0;
    1,0,1,1,1;
    1,1,0,0,1;
    1,1,0,0,0;
    1,0,1,1,1;
    1,1,0,1,0;
    0,1,0,0,0;
    1,0,1,0,0;
    1,1,1,0,1;
    0,0,1,1,0;
    0,1,0,0,1;
    0,1,1,0,0;
    0,0,0,1,0;
    1,1,0,0,0;
    1,0,0,0,0;
    1,0,1,0,1;
    1,1,0,0,1;
    0,0,1,1,0];
F_2 = [1,1,0,0,1;
    1,1,0,0,0;
    0,0,1,1,1;
    1,1,0,1,0;
    1,1,1,0,0;
    1,0,1,0,0;
    0,1,1,1,1;
    1,0,1,1,0;
    1,1,0,0,1;
    1,0,0,0,0;
    1,0,0,1,0;
    1,1,0,0,0;
    0,0,1,0,0;
    0,1,1,0,1;
    1,1,1,0,0;
    0,0,1,1,1;
    1,1,0,0,1;
    0,1,0,0,0;
    1,0,1,1,1;
    0,1,0,1,0;
    0,1,0,0,0;
    1,0,1,0,0;
    1,1,1,0,1;
    0,0,1,1,0;
    0,1,0,0,1;
    0,1,1,0,0;
    1,0,0,1,0;
    1,1,0,0,0;
    1,0,0,0,0;
    0,0,1,0,1;
    0,1,0,0,1;
    1,0,1,1,0];
initState1 = [0, 0, 1, 1, 0];
initState2 = [1, 0, 1, 0, 1];

%% 2 point trajectories

trajec = zeros(2:1); 
trajec(1,1) = bin2dec(num2str(initState1));
trajec(2,1) = bin2dec(num2str(initState2));
step1 = initState1;
step2 = initState2;
step1_dec = 0;
step2_dec = 0;
for i=1:t
    if(rand > c_1)
        step1 = bnNextState(step1,F_1,varF_1,nv_1);
        step1_dec = bin2dec(num2str(step1));
        step2 = bnNextState(step2,F_1,varF_1,nv_1);
        step2_dec = bin2dec(num2str(step2));
    else
        step1 = bnNextState(step1,F_2,varF_1,nv_1);
        step1_dec = bin2dec(num2str(step1));
        step2 = bnNextState(step2,F_2,varF_1,nv_1);
        step2_dec = bin2dec(num2str(step2));
    end
    trajec = [trajec, [step1_dec;step2_dec]]
end

plot(1:t+1,trajec);
