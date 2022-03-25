# midterm-project
<-- Introduction -->

This code uses psychtoolbox to show the observer a masking procedure, where a facial 
expression with emotional condition (happy or angry) is sandwiched between two neutral 
masks. 

The participant is then be presented with a neutral image and asked to rate how 
preferable they find that image on a scale from 1-10 (1 being least preferable, 10
being most preferable).

Our code runs through this procedure 4 times and has instructions included throughout
the trial. It randomly chooses an order to present 4 faces in and records the 
preference rating participants assign to an output spreadsheet.

We based this experiment off of a study by Faivre et al (Experiment 4a). The link is
below for your convenience if you'd like to read more about the study.
Link: https://www.frontiersin.org/articles/10.3389/fpsyg.2012.00129/full

Read our full project proposal for more information. The link is below.
Link: https://docs.google.com/document/d/13IvxMuq3ftQytQLwH7QFIUgEnL8j1SdORu0oUCOtHWA/edit


<-- How to run the code -->

There are many scripts in the github because we coded each component separately before
putting them all together in the final product. The final script that should be run is
titled "compiled_script.m" and it should be run from the working directory titled
"face-directory." 

At the end, the spreadsheet titled "Output.csv" can be opened to view the responses.
the 0 and 1 in the leftmost column specify the condition of the face presented. 1 is
recorded when the image was a happy face, and 0 is recorded when the image is an angry
face.
