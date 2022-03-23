sca;
close all;
clear;

% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

screens = Screen('Screens');
Screen('Preference', 'SkipSyncTests', 2);
%----------------------------------------------------------------------
%                       Screen setup
%----------------------------------------------------------------------u

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
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
DrawFormattedText(window, 'Focus on the fixation cross, then you will be presented with varying visual stimuli. At the end, you should rate how much you prefer a given character from 1-10 using the keyboard with 1 being least preferable to 10 being most preferable. Press any key to begin the trial.',...
'center', 'center', [1 1 1], 74);
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

% Draw the fixation cross in white, set it to the center of our screen andk
% set good quality antialiasing
Screen('DrawLines', window, allCoords,...
    lineWidthPix, white, [xCenter yCenter], 2);

KbStrokeWait;
Screen('Flip', window);

% KbStrokeWait;

WaitSecs(4);

%----------------------------------------------------------------------
%                       Mask Image Shows Up
%----------------------------------------------------------------------
% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

imagefile = dir('mask.png');
filename = imagefile.name;
maskimage = imread(filename);

% Make the image into a texture
imageTexture = Screen('MakeTexture', window, maskimage);

% Find Center
[xCenter, yCenter] = RectCenter(windowRect);

% Draw the image to the screen, unless otherwise specified PTB will draw
% the texture full size in the center of the screen. We first draw the
% image in its correct orientation.
Screen('DrawTexture', window, imageTexture, [], [xCenter-350 yCenter-500 xCenter+400 yCenter+300], 0);

% Flip to the screen
Screen('Flip', window);


% Wait for one second
WaitSecs(2);

% Clear the screen

WaitSecs(4);

%----------------------------------------------------------------------
%                       Face Image Shows Up
%----------------------------------------------------------------------


% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


MyImages = dir(fullfile(pwd,'*1.png'));
RandomNumber = randi([1 size(MyImages,1)]);
MyRandomImage = MyImages(RandomNumber).name;
image = imread(MyRandomImage);
% imshow(image);


% Make the image into a texture
imageTexture = Screen('MakeTexture', window, image);

% Find Center
[xCenter, yCenter] = RectCenter(windowRect);

% Draw the image to the screen, unless otherwise specified PTB will
% draw
% the texture full size in the center of the screen. We first draw the
% image in its correct orientation.
Screen('DrawTexture', window, imageTexture, [], [xCenter-400 yCenter-450 xCenter+400 yCenter+450], 0);

% Flip to the screen
Screen('Flip', window);


% Wait for one second
WaitSecs(2);

%----------------------------------------------------------------------
%                       Mask Image Shows Up
%----------------------------------------------------------------------
% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

imagefile = dir('mask.png');
filename = imagefile.name;
maskimage = imread(filename);

% Make the image into a texture
imageTexture = Screen('MakeTexture', window, maskimage);

% Find Center
[xCenter, yCenter] = RectCenter(windowRect);

% Draw the image to the screen, unless otherwise specified PTB will draw
% the texture full size in the center of the screen. We first draw the
% image in its correct orientation.
Screen('DrawTexture', window, imageTexture, [], [xCenter-350 yCenter-500 xCenter+400 yCenter+300], 0);

% Flip to the screen
Screen('Flip', window);


% Wait for one second
WaitSecs(2);

% Clear the screen

WaitSecs(4);

%----------------------------------------------------------------------
%                       Test Image Shows Up
%----------------------------------------------------------------------

MyTestImages = dir(fullfile(pwd,'*.jpg'));
RandomTestNumber = randi([1 size(MyTestImages,1)]);
MyRandomTestImage = MyTestImages(RandomTestNumber).name;
test_image = imread(MyRandomTestImage);
% imshow(image);


% Make the image into a texture
imageTexture = Screen('MakeTexture', window, test_image);

% Find Center
[xCenter, yCenter] = RectCenter(windowRect);

% Draw the image to the screen, unless otherwise specified PTB will draw
% the texture full size in the center of the screen. We first draw the
% image in its correct orientation.
Screen('DrawTexture', window, imageTexture, [], [xCenter-400 yCenter-430 xCenter+400 yCenter+430], 0);

% Flip to the screen
Screen('Flip', window);


% Wait for one second
WaitSecs(2);
