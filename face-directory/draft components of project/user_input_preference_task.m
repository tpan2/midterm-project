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
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);
%
%
%
%
% #1: Display text instructions
Screen('TextSize', window, 30 );
Screen('TextFont', window, 'Arial');
DrawFormattedText(window, 'Please rate the last image you saw from 1 to 10 with 1 being "not preferable" to 10 being "very preferable"',...
'center', 'center', [1 1 1]);
Screen('Flip', window);

