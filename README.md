# Vote for Music

##Authors
  *Eugene Tsai
  *Eddy Kim
  *Alex Huang

##Purpose
  *During long car rides there is usually just one person playing music. This app 
  will allow everyone to choose which music is being played.

##Features
  *connect to multiple Soundcloud accounts
  *play music from Soundcloud
  *users vote on songs to be played 

##Control Flow
  *splash screen is shown while app is launching
  *users log in their accounts in log in screen
  *they join a private group with their friends
  *they submit as many songs as they want to a combined playlist with the group
  *up to four songs are randomly chosen to be voted on 
  *song that receives the most votes is played next
  
##Implementation
###Model
  *SongChoices.swift
###View
  *VoteForSongListTableView
###Controller
  *SplashScreenViewController.swift
  *LogInScreenViewController.swift
  *JoinGroupScreenViewController.swift
  *SongsScreenViewController.swift
  *VoteScreenViewController.swift
  *CurrentPlayList.swift
