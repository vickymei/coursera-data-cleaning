#####################
### DATA CLEANING ###
#####################

### Libraries ###
library(stringr)
### Setting Working Directory ###
setwd("/Users/Morello/Desktop/coursera practicum/data cleaning")
maindata = read.csv("raw.csv", header = F)
maindata = data.frame(maindata)

#naming the existent 26 variables#
names(maindata)[1:26]= c("illinois_user_id", "hashed_session_cookie_id", "server_timestamp"
                         , "hashed_ip", "user_agent", "url", "initial_referrer_url" 
                         ,"browser_language", "course_id" , "country_cd", "region_cd", "timezone", "os"
                         , "browser", "key", "playback_rate_delta", "module_id", "playback_rate"
                         , "timecode", "video_name", "language_code", "subtitle_language", "volume"
                         , "volume_delta", "tech", "item_id")

#insert eventing_central_ts into dataframe in specific location#
partnames = names(maindata)%in%c("illinois_user_id", "hashed_session_cookie_id", " server_timestamp")
maindata1 = maindata[partnames]
maindata2 = maindata[!partnames]
maindata3 = cbind(maindata1, eventing_central_ts = 0) 
maindata = cbind(maindata3, maindata2)

#insert JSON into dataframe in specific location#
partnames1 = names(maindata)%in%c("illinois_user_id", "hashed_session_cookie_id", "server_timestamp"
                                 , "eventing_central_ts", "hashed_ip", "user_agent", "url", "initial_referrer_url" 
                                 ,"browser_language", "course_id" , "country_cd", "region_cd", "timezone", "os"
                                 , "browser", "key")
maindata4 = maindata[partnames1]
maindata5 = maindata[!partnames1]
maindata6 = cbind(maindata4, JSON = 0)
maindata = cbind(maindata6, maindata5)

#forming JSON#
maindata$JSON = paste(maindata$playback_rate_delta,",", maindata$module_id, ",", maindata$playback_rate
                      , maindata$timecode,",",maindata$video_name,",", maindata$language_code
                      , ",", maindata$subtitle_language, ",", maindata$volume
                      , ",", maindata$volume_delta, ",", maindata$tech, ",", maindata$item_id)

###tranform JSON variables into readable variables###
maindata = data.frame(maindata)

#playback_rate_delta transformation#
maindata$playback_rate_delta = as.character(maindata$playback_rate_delta)
maindata$playback_rate_delta = str_sub(maindata$playback_rate_delta, start = 27, end = nchar(maindata$playback_rate_delta)-2)  
maindata$playback_rate_delta = as.numeric(maindata$playback_rate_delta)

#subtitle_language transformation#
maindata$subtitle_language = as.character(maindata$subtitle_language)
maindata$subtitle_language = str_sub(maindata$subtitle_language, start = 25, end = nchar(maindata$subtitle_language)-2)  

#module_id transformation#
maindata$module_id = as.character(maindata$module_id)
maindata$module_id = str_sub(maindata$module_id, start = 17, end = nchar(maindata$module_id)-2)

#playback_rate transformation#
maindata$playback_rate = as.character(maindata$playback_rate)
maindata$playback_rate = str_sub(maindata$playback_rate, start = 21, end = nchar(maindata$playback_rate)-2)
maindata$playback_rate = as.numeric(maindata$playback_rate)

#timecode transformation#
maindata$timecode = as.character(maindata$timecode)
maindata$timecode = str_sub(maindata$timecode, start = 16, end = nchar(maindata$timecode)-2)
maindata$timecode = as.numeric(maindata$timecode)
maindata$timecode = round(maindata$timecode, digits = 4)

#video_name transformation#
maindata$video_name = as.character(maindata$video_name)
maindata$video_name = str_sub(maindata$video_name, start = 18, end = nchar(maindata$video_name)-2)

#language_code transformation#
maindata$language_code = as.character(maindata$language_code)
maindata$language_code = str_sub(maindata$language_code, start = 21, end = nchar(maindata$language_code)-2)
maindata$language_code = as.numeric(maindata$language_code)

#volume transformation#
maindata$volume = as.character(maindata$volume)
maindata$volume = str_sub(maindata$volume, start = 14, end = nchar(maindata$volume)-2)
maindata$volume = as.numeric(maindata$volume)

#volume_delta transformation#
maindata$volume_delta = as.character(maindata$volume_delta)
maindata$volume_delta = str_sub(maindata$volume_delta, start = 20, end = nchar(maindata$volume_delta)-2)
maindata$volume_delta = as.numeric(maindata$volume_delta)

#tech transformation#
maindata$tech = as.character(maindata$tech)
maindata$tech = str_sub(maindata$tech, start = 12, end = nchar(maindata$tech)-2)

#item_id transformation#
maindata$item_id = as.character(maindata$item_id)
maindata$item_id = str_sub(maindata$item_id, start = 15, end = nchar(maindata$item_id)-4)

class(maindata$server_timestamp)
#maindata$server_timestamp = as.character(maindata$server_timestamp)
#maindata$server_timestamp = as.POSIXct(strptime(maindata$server_timestamp, "%m/%d/%y %H:%M")) 

