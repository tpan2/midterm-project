%Completed: script successfully displays face in correct location in a
%black background
%Next steps in this script: find a way to randomly draw from both images 

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

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Get the size of the on screen window
[screenXpixels, screenYpixels] = Screen('WindowSize', window);

% Query the frame duration
ifi = Screen('GetFlipInterval', window);

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


MyImages = dir(fullfile(pwd,'*.jpg'));
RandomNumber = randi([1 size(MyImages,1)]);
MyRandomImage = MyImages(RandomNumber).name;
image = imread(MyRandomImage);
% imshow(image);


% Make the image into a texture
imageTexture = Screen('MakeTexture', window, image);

% Find Center
[xCenter, yCenter] = RectCenter(windowRect);

% Draw the image to the screen, unless otherwise specified PTB will draw
% the texture full size in the center of the screen. We first draw the
% image in its correct orientation.
Screen('DrawTexture', window, imageTexture, [], [xCenter-400 yCenter-400 xCenter+400 yCenter+400], 0);

% Flip to the screen
Screen('Flip', window);


% Wait for one second
WaitSecs(2);

% Clear the screen
sca;