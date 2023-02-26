% Will be used to determine to extract the time-corresponding values of the
% transmissometer and Malvern data

clear
clc
close all

%% Numbers are from NASA documentation
testNames = ["baseline01";
             "baseline02";
             "baseline03";
             "baseline04";
             "fog01";
             "fog02";
             "fog03";
             "fog04";
             "fog06";
             "fog08"];
%% According to NASA documentation...
% Year, month, day, hour, minute, second, millisecond

startOfExperiment = [datetime(2021, 5, 11, 10, 47, 27, 331);  % baseline01
                     datetime(2021, 5, 11, 10, 50, 04, 854);  % baseline02
                     datetime(2021, 5, 11, 10, 54, 57, 179);  % 03
                     datetime(2021, 5, 11, 10, 57, 44, 260);  % 04
                     datetime(2021, 5, 11, 11, 55, 16, 294);  % fog01
                     datetime(2021, 5, 11, 12, 29, 03, 237);  % fog02
                     datetime(2021, 5, 11, 12, 55, 33, 234);  % 03
                     datetime(2021, 5, 11, 13, 25, 57, 371);  % 04
                     datetime(2021, 5, 11, 15, 20, 23, 586);  % 06
                     datetime(2021, 5, 12, 10, 13, 30, 999);  % 08
                     ];
            
% hours, minutes, seconds, milliseconds
duration = [0 0  46 688;  % baseline01
            0 1  11 301;  % baseline02
            0 1   9 518;  % 03
            0 0  50 842;  % 04
            0 25  3 796;  % fog01
            0 13 58 549;  % fog02
            0 15 49 901;  % 03
            0 16 03 175;  % 04
            1 13 27 429;  % 06
            0 35 53 752;];  % 08