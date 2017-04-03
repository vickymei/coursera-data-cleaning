# coursera-data-cleaning

Coursera's clickstream data is the log of users interaction with videos in Coursera. Each row of the log is an event which records all the information for interaction between users and video UI. These records are useful for later analysis and prediction of users' behavior and operation of Coursera. 

Because clickstream datasets are of large size and volume in the same format, a syntax to clean these files before continuing further research is necessary and convenient.

This repository is aimed at formalizing all the daily files provided by University of Illinois and make them readable, also extracting valuable information from JSON records is a main task. 

Web log of users' hebavior is recorded for every single day. For an example, daily record for 02/01/2017 is named as 'video-2017-02-01', and there are 919768 rows in the original csv file and 26 columns including userID, video information, JSON formated website records and so on. The explanation of every variable can be found at https://wiki.illinois.edu/wiki/display/coursera/video. Normally, the files are larger than 600 MB.

