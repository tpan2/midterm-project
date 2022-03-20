% 
% sca;
% close all;
% clear;
% 
% % Here we call some default settings for setting up Psychtoolbox
% PsychDefaultSetup(2);
% 
% % Get the screen numbers
% screens = Screen('Screens');
% 
% % Draw to the external screen if avaliable
% screenNumber = max(screens);
% 
% folder = 'C:
% v = randperm(length(files));
% for pl = 1:length(files)
%     N=imread([StimuliFolder files{v(pl)} '.jpg'])
%     imageTexture = Screen('MakeTexture', window, N);
%     Screen('DrawTexture', window, imageTexture, [], [], 0);
%     Screen('Flip', window);
%     WaitSecs(1);
url = 'https://i.ibb.co/H4R03hy/happy.png'
happyimage=webread(url);
imagesc(happyimage)
