# SCloudNine

##Authors
  * Eugene Tsai
  * Eddy Kim
  * Alex Huang

##Purpose
  * during long car rides there is usually just one person playing music. This 
 app will allow everyone to choose which music is being played.

##Features
  * connect to multiple Soundcloud accounts
  * play music from Soundcloud
  * users vote on songs to be played 

##Control Flow
  * splash screen is shown while app is launching
  * users log in their accounts in log in screen
  * they join a private group with their friends
  * they submit as many songs as they want to a combined playlist with the group
  * song that receives the most votes is played next
  
##Implementation

###Model
  * Constants.swift
  * FAIcon.swift

###View
  * ViewController.swift
  * GroupViewController.swift
  * MainViewController.swift

###Controller
  * CreateRoomViewController.swift
  * InviteToRoomViewController.swift
  * LookForRoomsToJoinViewController.swift
  * JoinRoomViewController.swift
  * SongsScreenViewController.swift
  * SearchViewController.swift
  * PlaylistViewController.swift
