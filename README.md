# midterm-project
<-- Introduction -->

This code uses psychtoolbox to show the observer a masking procedure, where a facial 
expression with emotional condition (happy or angry) is sandwiched between two neutral 
masks. 

The participant is then be presented with a neutral image and asked to rate how 
preferable they find that image on a scale from 1-9 (1 being least preferable, 9
being most preferable).

Our code runs through this procedure 4 times and has instructions included throughout
the trial. It randomly chooses an order to present 4 faces in and records the 
preference rating participants assign to an output spreadsheet.

It creates as many sheets in our spreadsheet as participants we have completing 
the procedure. Then, we run another script which combs through all of the data 
and conducts a normality test to check whether Student's t-test should be used
or the Mann-Whitney U test. It also generates a boxplot of the data and a summary
statistics table.

We based this experiment off of a study by Faivre et al (Experiment 4a). The link is
below for your convenience if you'd like to read more about the study.
Link: https://www.frontiersin.org/articles/10.3389/fpsyg.2012.00129/full

For background information on the task, read our short literature review.
Link: https://docs.google.com/document/d/17ph5g39RepGwgK-EuXs8uDaLvatvQh8CYKnX1sF_IBQ/edit?usp=sharing

Read our full project proposal for more information.
Link: https://docs.google.com/document/d/13IvxMuq3ftQytQLwH7QFIUgEnL8j1SdORu0oUCOtHWA/edit


<-- How to run the code -->

There are many scripts in the github because we coded each component separately before
putting them all together in the final product. The final script that should be run is
titled "compiled_script.m" and it should be run from the working directory titled
"face-directory." This script will show the masking procedure.

At the end, the spreadsheet titled "Output.csv" can be opened to view the responses.
the 0 and 1 in the leftmost column specify the condition of the face presented. 1 is
recorded when the image was a happy face, and 0 is recorded when the image is an angry
face.

To run summary stats and a plot, run "table_plot.m." The summary statistics table will show up
in the command window as well as the significance value. The plot opens up in a new
window.
