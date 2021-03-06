sca;
close all;
clear;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
screens = Screen('Screens');

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and whit
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black,[0 0 1000 1000]);

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
%
%
%
%--------------------------------
% #1: Display text instructions
%--------------------------------
%
Screen('TextSize', window, 30 );
Screen('TextFont', window, 'Arial');
DrawFormattedText(window, 'This is the title page of our project. Press any key to begin the trial.  ',...
'center', 'center', [1 1 1]);
Screen('Flip', window);

FlushEvents('keyDown');
%make sure that previous inputs are erased

trialstore = ones(1,1);
%create empty matrix for responses

time1 = GetSecs;
time = 0;

while time < 3;
    %3 sec is how long they have to answer the prompt
    [keyIsDown, time2, keyCode, deltasecs] = KbCheck;
    time = time2-time1;
   
    if (keyIsDown) == 1;
        key = KbName(find(keyCode))
        disp(key);
        b=regexp(key,'\d','match')
        %'\d' refers to any one digit/non-digit character. This is intended
        %to separate the number from the other character that comes with
        %the number
        key1=str2double([b{:}])
            trialstore(1,1) = key1;
            %i is number of trials
            % trialstore(i,i)= key
            %enter in the number input (key) as a new entry into a matrix
            xlswrite('Output.csv',trialstore);
            disp(trialstore);

    end
end


KbStrokeWait;
sca;
