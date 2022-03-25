sca;
close all;
clear;

% Here we call some default settings for 1 2 3 4setting up Psychtoolbox
PsychDefaultSetup(2);

screens = Screen('Screens');
Screen('Preference', 'SkipSyncTests', 2);
%----------------------------------------------------------------------
%                       Screen setup
%----------------------------------------------------------------------

% Draw to the external screen if avaliable
screenNumber = max(screens);

% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);

% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black,[0 0 1000 1000]);

% Get the size of the on screen  window
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
DrawFormattedText(window, 'Focus on the fixation cross, then you will be presented with varying visual stimuli. At the end, you should rate how much you prefer a given character from 1-10 using the keyboard with 1 being least preferable to 10 being most preferable. You will have 3 seconds to choose your response. Press any key to begin the trial.',...
'center', 'center', [1 1 1], 74);
Screen('Flip', window);
%
%

% chooses a random order for the emotional images to be displayed, in the
% loop
MyImages = dir('*1.png');
nfiles = length(MyImages);
randomorder = randperm(nfiles);

combinedstore = zeros(nfiles,2);
%Create a matrix for nfiles and 2 columns (one for condition and one for
%valence)

for ii = 1:nfiles
    % For loop so that the experiment will run however many times as however
    % many salient faces we have in our directory.

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

    WaitSecs(.3);

    %----------------------------------------------------------------------
    %                       Mask Image Shows Up
    %----------------------------------------------------------------------
    % Query the frame duration
    ifi = Screen('GetFlipInterval', window);

    % Set up alpha-blending for smooth (anti-aliased) lines
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

    % finds, reads mask image
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


    % Wait for .5 seconds
    WaitSecs(.5);

    % Clear the screen


    %----------------------------------------------------------------------
    %                       Face Image Shows Up
    %----------------------------------------------------------------------

    % Query the frame duration
    ifi = Screen('GetFlipInterval', window);

    % Set up alpha-blending for smooth (anti-aliased) lines
    Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');


    MyImages = dir(fullfile(pwd,'*1.png'));
    %RandomNumber = randi([1 size(MyImages,1)])
    % ordering_images = randperm(nfiles);
    MyRandomImage = MyImages(randomorder(ii)).name;
    image = imread(MyRandomImage);
    pat = "happy";
    condition = contains(MyRandomImage, pat);
    %condition = 1 when the image is a happy face
    %condition = 0 when the image is an angry face

    % Make the image into a texture
    imageTexture = Screen('MakeTexture', window, image);

    % Find Center
    [xCenter, yCenter] = RectCenter(windowRect);

    % Draw the image to the screen, unless otherwise specified PTB will
    % draw
    % the texture full size in the center of the screen. We first draw the
    % image in its correct orientation.
    % Screen('DrawTexture', window, imageTexture, [], [xCenter-400 yCenter-450
    % xCenter+400 yCenter+450], 0);
    Screen('DrawTexture', window, imageTexture, [], [xCenter-350 yCenter-500 xCenter+400 yCenter+300], 0);

    % Flip to the screen
    Screen('Flip', window);

    % Wait for one second
    WaitSecs(.033);

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

    % Draw the image to the screen, unless otherwise specified PTB will3 draw
    % the texture full size in the center of the screen. We first draw the
    % image in its correct orientation.
    Screen('DrawTexture', window, imageTexture, [], [xCenter-350 yCenter-500 xCenter+400 yCenter+300], 0);

    % Flip to the screen
    Screen('Flip', window);


    % Wait for one second
    WaitSecs(.05);

    % Clear the screen

    %----------------------------------------------------------------------
    %                       Test Image Shows Up
    %----------------------------------------------------------------------

    MyTestImages = dir(fullfile(pwd,'*.jpg'));
    RandomTestNumber = randi([1 size(MyTestImages,1)]);
    MyRandomTestImage = MyTestImages(RandomTestNumber).name;
    test_image = imread(MyRandomTestImage);
    % shows a random test image from our directory


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


    %----------------------------------------------------------------------
    %                       Collect Output
    %----------------------------------------------------------------------

    FlushEvents('keyDown');
    %make sure that previous inputs are erased

    trialstore = ones(1,1)
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
            key1=str2double([b{:}]);
                trialstore(1,1) = key1; 
                combinedstore(ii,:) = [condition, trialstore];
         
               
                %i is number of trials
                % trialstore(i,i)= key
                %enter in the number input (key) as a new entry into a matrix


        end
    end 
    
    %----------------------
    % Instructions between trials 
    %----------------------
    if ii~=nfiles
        Screen('TextSize', window, 30 );
        Screen('TextFont', window, 'Arial');
        DrawFormattedText(window, 'Press any key to proceed to the next trial.',...
        'center', 'center', [1 1 1], 74);
        Screen('Flip', window);
    % between trials, these instructions show on the screen
    else
        Screen('TextSize', window, 30 );
        Screen('TextFont', window, 'Arial');
        DrawFormattedText(window, 'This concludes this experiment. Thank you for participating.The screen will close shortly.',...
        'center', 'center', [1 1 1], 74);
        Screen('Flip', window);
    % end screen instructions
WaitSecs(3)


    end
end

filename = 'Output.csv';
xlswrite(filename, combinedstore);

sca; 

