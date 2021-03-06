%Hi Shanzeh, 
%I started writing some code based off the tutorials. There are two parts:
%text and fixation cross. feel free to try out the script and let me know
%your thoughts later. Headed to the hospital, bye!
%
%
%
% 
% 
%
% Clear the workspace and the screen
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
%
%
%
%----------------------
% #2: Fixation Cross
%----------------------
%
% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% Setup the text type for the window
Screen('TextFont', window, 'Ariel');
Screen('TextSize', window, 36);

% Get the centre coordinate of the window
[xCenter, yCenter] = RectCenter(windowRect);

% Here we set the size of the arms of our fixation cross
fixCrossDimPix = 40;

% Now we set the coordinates (these are all relative to zero we will let
% the drawing routine center the cross in the center of our monitor for us)
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

% Set the line width for our fixation cross
lineWidthPix = 4;

% Draw the fixation cross in white, set it to the center of our screen and
% set good quality antialiasing
Screen('DrawLines', window, allCoords,...
    lineWidthPix, white, [xCenter yCenter], 2);

KbStrokeWait;
Screen('Flip', window);

KbStrokeWait;
sca;

%Next, code the mask
