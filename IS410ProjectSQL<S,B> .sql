
/* create table commands */

create table PointsTable ( 
    TeamID Number(38) not null , 
    MatchesPlayed Integer not null,
    MatchesWon Integer not null,
    MatchesLost integer not null, 
    NetRunRate number(6,5) not null, 
    PointsEarned integer not null, 
    
Constraint PointsTablePK Primary Key (TeamID),
Constraint PointsTableFK Foreign Key (TeamID) references Team(TeamID) ) ; 


create table Schedule ( 
    MatchID   INTEGER  NOT NULL, 
    MatchDate Date  NOT NULL, 
    Venue VARCHAR2(100) NOT NULL,
    MatchType VARCHAR2(25) NOT NULL, 
    SeasonYear INTEGER Default 2024 NOT NULL,
    TeamAID Number(38) Not Null, 
    TeamBID Number(38) Not Null, 
    WinningTeamID Number(38), 
    
Constraint SchedulePK Primary Key (MatchID), 
constraint TeamA Foreign Key(TeamAID) references Team(TeamID), 
constraint TeamB Foreign Key(TeamBID) references Team(TeamID), 
constraint WinningTeam Foreign Key(WinningTeamID) references Team(TeamID)); 


create table Team ( 
 TeamID Integer not NULL,
 TeamName VarChar(100) NOT NULL,
 HeadCoach VarChar(100) NOT NULL,
 HomeVenue VarChar(100) NOT NULL, 
 
 Constraint TeamPK Primary Key (TeamID)
 ); 


create table Auction ( 
    AuctionID integer not NULL,
    AuctionDate date Default to_Date( '2023-12-19' , 'YYYY-MM-DD') not null,
    SoldPrice Decimal (20,2) ,
    BasePrice Decimal (20,2) not null, 
    Status VARCHAR2(25) not null, 
    PlayerID Number(38) Not NUll,
    TeamID Number(38) Not NULL, 
    AuctionYear Number(4) Not NULL, 
Constraint AuctionPK Primary key (AuctionID),
Constraint PlayerFK Foreign Key (PlayerID) references Player(PlayerID),
Constraint TeamFK Foreign Key (TeamID) references Team(TeamID)
); 


    
create table Player ( 
    PlayerID integer not NULL,
    PlayerName VarChar(100) not NULL,
    PlayerRole VarChar(100) not NULL,
    BattingStyle VarChar(100),
    BowlingStyle VarChar(100),
    Country VarChar(100) not NULL,
    IsKeeper Number(1) not null ,
Constraint PlayerPK Primary key (PlayerID)     
    ); 
    
    
create table BattingStats ( 
    BattingStatsID integer not NULL,
    Runs integer not Null, 
    MatchesPlayed integer not null, 
    Innings integer not null,
    NotOuts integer not null,
    StrikeRate  Decimal(10,2),
    Dismissals integer not null,
    BestBatting VARCHAR2(25) not null, 
    BattingAverage Decimal(10,2),
    BallsFaced Integer not null,
    Season Integer  default 2024 not null , 
    PlayerID Number(38) NOT NULL, 
    Constraint BattingStatsPK Primary Key ( BattingStatsID),
    Constraint BattingStatsFk Foreign key ( PlayerID ) references player(PlayerID)); 



create table BowlingStats (  
    BowlingStatsID integer not NUll, 
    Wickets integer not null, 
    MatchesPlayed integer not null,
    Economy NUMBER (10,2) , 
    OversBowled NUMBER (4,1) not null, 
    BowlingAverage NUMBER (10,2),
    RunsConceded integer not null, 
    BestBowlingWickets integer not null, 
    BestBowlingRuns integer not null, 
    BowlingStrikeRate NUMBER(10,2),
    Season Integer default 2024 Not null ,
    PlayerID Number(38) Not Null, 
    Constraint BowlingStatsPK Primary Key ( BowlingStatsID),
    Constraint BowlingStatsFk Foreign key ( PlayerID ) references player(PlayerID));
    
 
/*insert for Schedule */

insert into Schedule (MatchID,MatchDate, Venue, MatchType, SeasonYear, TeamAID,TeamBID,WinningTeamID  ) 
values (2001, to_date('2024-4-15','YYYY-MM-DD'),'M.Chinnaswamy Stadium', 'League' , 2024, 50005, 50007, 50007 ) ; 

insert into Schedule (MatchID,MatchDate, Venue, MatchType, SeasonYear, TeamAID,TeamBID,WinningTeamID  ) 
values (2002, to_date('2024-3-27','YYYY-MM-DD'),'Rajiv Gandhi International Stadium', 'League' , 2024, 50007, 50004, 50007 ) ; 

insert into Schedule (MatchID,MatchDate, Venue, MatchType, SeasonYear, TeamAID,TeamBID,WinningTeamID  ) 
values (2003, to_date('2024-4-26','YYYY-MM-DD'),'Eden Gardens Stadium', 'League' , 2024, 50003, 50006, 50006 ) ; 

insert into Schedule (MatchID,MatchDate, Venue, MatchType, SeasonYear, TeamAID,TeamBID,WinningTeamID  ) 
values (2004, to_date('2024-5-22','YYYY-MM-DD'),'Narendra Modi Stadium', 'Playoff' , 2024, 50008, 50005, 50008 )  ;

insert into Schedule (MatchID,MatchDate, Venue, MatchType, SeasonYear, TeamAID,TeamBID,WinningTeamID  ) 
values (2005, to_date('2024-4-17','YYYY-MM-DD'),'Narendra Modi Stadium', 'League' , 2024, 50009, 50002, 50002 ) ; 




/*insert for Team */

insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50001, 'Chennai Super Kings' , 'Stephen Fleming' , 'M.A. Chidambaram Stadium' ); 
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50002, 'Delhi Capitals' , 'Ricky Ponting' , 'Arun Jaitley Stadium' ) ; 
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50003, 'Kolkata Knight Riders' , 'Chandrakant Pandit' , 'Eden Gardens Stadium' ) ; 
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50004, 'Mumbai Indians' , 'Mark Boucher' , 'Wankhede Stadium' ) ;
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50005, 'Royal Challengers Bangalore' , 'Andy Flower' , 'M. Chinnaswamy Stadium' ) ;
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50006, 'Punjab Kings' , 'Trevor Bayliss' , 'Maharaja Yadavindra Singh Stadium' ) ; 
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50007, 'Sunrisers Hyderabad' , 'Daniel Vettori' , 'Rajiv Gandhi International Stadium' ) ; 
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50008, 'Rajasthan Royals' , 'Kumar Sangakkara' , 'Sawai Mansingh Stadium' ) ; 
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50009, 'Gujarat Titans' , 'Ashish Nehra' , 'Narendra Modi Stadium' ) ; 
insert into Team (TeamID, TeamName, HeadCoach, HomeVenue) values (50010, 'Lucknow Super Giants' , 'Justin Langer' , 'BRSABV Ekana Cricket Stadium' ) ; 

/*Insert for Player */ 

insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3001, 'Mitchell Starc', 'Bowler', 'Left Handed' , 'Left Arm Fast', 'Australia', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3002, 'Pat Cummins', 'All-Rounder', 'Right Handed' , 'Right Arm Fast Medium', 'Australia', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3003, 'Daryl Mitchell', 'All-Rounder', 'Right Handed' , 'Right Arm Medium', 'New Zealand', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3004, 'Harshal Patel', 'Bowler', 'Right Handed' , 'Right Arm Fast Medium', 'India', 0) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3005, 'Alzarri Joseph', 'Bowler', 'Right Handed' , 'Right Arm Fast Medium', 'Antigua',0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3006, 'Spencer Johnson', 'Bowler', 'Left Handed' , 'Left Arm Fast', 'Australia', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3007, 'Sameer Rizvi', 'Batsman', 'Right Handed' , ' Right Arm Off Break', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3008, 'Rilee Rossouw', 'Batsman', 'Left Handed' , 'Right Arm Off Break', 'South Africa', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3009, 'Shahrukh Khan', 'Batsman', 'Right Handed' , 'Right Arm Off Break', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3010, 'Rovman Powell', 'Batsman', 'Right Handed' , 'Right Arm Medium', 'Jamaica', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3011, 'Virat Kohli', 'Batsman', 'Right Handed' , 'Right Arm Medium', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3012, 'Ruturaj Gaikwad', 'Batsman', 'Right Handed' , 'Right Arm Off Break', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3013, 'Riyan Parag', 'All-Rounder', 'Right Handed' , 'Right Arm Off Break', 'India',0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3014, 'Travis Head', 'Batsman', 'Left Handed' , 'Right Arm Off Break', 'Australia', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3015, 'Sanju Samson', 'Batsman', 'Right Handed' , NULL, 'India', 1 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3016, 'Sai Sudarshan', 'Batsman', 'Left Handed' , 'Right Arm Leg Break', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3017, 'KL Rahul', 'Batsman', 'Right Handed' , NULL, 'India', 1 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3018, 'Nicolas Pooran', 'Batsman', 'Left Handed' , 'Right Arm Off Break', 'Trinidad and Tobago', 1 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3019, 'Sunil Narine', 'All-Rounder', 'Left Handed' , 'Right Arm Off Break', 'Trinidad and Tobago', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3020, 'Abhishek Sharma', 'All-Rounder', 'Left Handed' , 'Left Arm Orthodox', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3021, 'Varun Chakravarthy', 'Bowler', 'Right Handed' , 'Right Arm Leg Spin', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3022, 'Jasprit Bumrah', 'Bowler', 'Right Handed' , 'Right Arm Fast', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3023, 'T Natarajan', 'Bowler', 'Left Handed' , 'Left Arm Medium', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3024, 'Harshit Rana', 'Bowler', 'Right Handed' , 'Right Arm Fast', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3025, 'Avesh Khan', 'Bowler', 'Right Handed' , 'Right Arm Fast Medium', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3026, 'Arshdeep Singh', 'Bowler', 'Left Handed' , 'Left Arm Fast Medium', 'India',0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3027, 'Andre Russell', 'All-Rounder', 'Right Handed' , 'Right Arm Fast Medium', 'Jamaica', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3028, 'Yuzvendra Chahal', 'Bowler', 'Right Handed' , 'Right Arm Leg Break', 'India',0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3029, 'Tushar Deshpande', 'Bowler', 'Left Handed' , 'Right Arm Fast Medium', 'India', 0 ) ; 
insert into Player (PlayerID, PlayerName, PlayerRole, BattingStyle, BowlingStyle, Country, IsKeeper  ) 
values ( 3030, 'Khaleel Ahmed', 'Bowler', 'Right Handed' , 'Left Arm Fast Medium', 'India', 0 ) ; 



/*Insert for Auction */

insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4001, to_date('2023-12-19', 'YYYY-MM-DD'), 24.75, 2.00 , 2024, 'Sold' , 3001, 50003); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4002, to_date('2023-12-19', 'YYYY-MM-DD') , 20.50, 2.00 , 2024, 'Sold' , 3002, 50007); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4003, to_date('2023-12-19', 'YYYY-MM-DD'), 14.00, 1.00 , 2024, 'Sold' , 3003, 50001); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4004, to_date('2023-12-19', 'YYYY-MM-DD'), 11.75, 2.00 , 2024, 'Sold' , 3004, 50006); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4005, to_date('2023-12-19', 'YYYY-MM-DD') , 11.50, 1.00 , 2024, 'Sold' , 3005, 50005); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4006, to_date('2023-12-19', 'YYYY-MM-DD'), 10.00, 0.50 , 2024, 'Sold' , 3006, 50009); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4007, to_date('2023-12-19', 'YYYY-MM-DD') , 8.40, 0.20 , 2024, 'Sold' , 3007, 50001); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4008, to_date('2023-12-19', 'YYYY-MM-DD'), 8.00, 2.00 , 2024, 'Sold' , 3008, 50006); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4009, to_date('2023-12-19', 'YYYY-MM-DD') ,7.40, 0.20 , 2024, 'Sold' , 3009, 50009); 
insert into Auction ( AuctionID, AuctionDate , SoldPrice, BasePrice, AuctionYear, Status, PlayerID, TeamID) 
values (4010, to_date('2023-12-19', 'YYYY-MM-DD'), 7.40, 1.00 , 2024, 'Sold' , 3010, 50008); 

/*Insert for BowlingStats*/

insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60001, 24,14,9.73,49,19.87,477,3, 15, 12.25, 2024,3004 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60002, 21,15,8.04,50,19.14,402,3, 16, 14.28, 2024,3021 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60003, 20,13,6.48,51.5,16.80,336,5, 21, 15.55, 2024,3022 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60004, 19,14,9.05,51.2,24.47,465,4, 19, 16.21, 2024,3023 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60005, 19,13,9.08,42.1,20.15,383,3, 24, 13.31, 2024,3024 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60006, 19,16,9.59,54.5,27.68,526,3, 27, 17.31, 2024,3025 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60007, 19,14,10.03,50.2,26.57,505,4, 29, 15.89, 2024,3026 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60008, 19,15,10.05,29.2,15.52,295,3, 19, 9.26, 2024,3027 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60009, 18,16,9.27,61.0,31.44,566,3, 43, 20.33, 2024,3002 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60010, 18,15,9.41,58.0,30.33,546,3, 11, 19.33, 2024,3028 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60011, 17,15,6.69,55.0,21.64,368,2, 22, 19.41, 2024,3019 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60012, 17,13,8.83,48.0,24.94,424,4, 27, 16.94, 2024,3029 ) ; 
insert into BowlingStats(BowlingStatsID, Wickets, MatchesPlayed, Economy, OversBowled, BowlingAverage, RunsConceded, BestBowlingWickets, BestBowlingRuns, BowlingStrikeRate, Season, PlayerID) 
values (60013, 17,14,9.58,50.0,28.17,474,2, 21, 17.64, 2024,3030 ) ; 


/*Insert for BattingStats*/ 

insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values(7001, 741,15 ,15, 3 , 154.69 , 12, '113*', 61.75, 479,2024, 3011);  
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values(7002, 583, 14, 14,3 , 141.16, 11 , '108*', 53.00, 413,2024, 3012);  
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values(7003, 573 , 16 , 14 ,3, 149.21 , 11, '84*', 52.09, 384,2024, 3013) ; 
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values( 7004 , 567 ,15 , 15 ,1 , 191.55 ,14 ,'102', 40.50 , 296,2024, 3014) ; 
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values( 7005 , 531, 16, 15 ,4  , 153.46 ,11, '86', 48.27, 346 ,2024, 3015) ; 
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values( 7006, 527,12, 12 , 1 , 141.28  ,11 , '103', 47.91, 373,2024, 3016 ) ; 
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values(7007, 520 , 14, 14, 0 , 136.12 , 14 , '82', 37.14,382,2024, 3017) ; 
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values( 7008 , 499 , 14, 14, 6 , 178.21 , 8 , '75', 62.38 ,280,2024, 3018) ;  
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values( 7009 , 488 ,15,14 ,0, 180.74 ,14 , '109' , 34.86, 270,2024, 3019);  
insert into BattingStats(BattingStatsID, Runs, MatchesPlayed, Innings, NotOuts,StrikeRate, Dismissals,BestBatting, BattingAverage,BallsFaced,Season,PlayerID)
Values( 7010 , 484, 16,16, 1 ,204.21,  15, '75*' , 32.27 , 237 ,2024, 3020 ); 



/*Insert for PointsTable */

insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50003, 14 , 9 , 3 , 1.428, 20);
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values (50007, 14 , 8 , 5, 0.414, 17);
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50008, 14 , 8 , 5, 0.273, 17 );
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50005, 14 , 7 , 7, 0.459, 14);
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50001, 14 , 7, 7, 0.392, 14 );
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50002,14 , 7, 7 , -0.377, 14); 
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50010,14 , 7,7 , -0.667,14);
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50009,14 , 5,7 , -1.063,12 ); 
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50006,14 , 5, 9 , -0.353,10 ); 
insert into PointsTable(TeamID, MatchesPlayed,MatchesWon,MatchesLost,NetRunRate,PointsEarned)
values(50004,14  , 4,10 , -0.318, 8 ); 





/*All Queries */ 


--UPDATE Statement 1
/*Update the Home Venue of Delhi Capitals because of a Political Event*/


Update Team
Set HomeVenue= 'ACA-VDCA Stadium'
Where TeamName='Delhi Capitals'; 


--Update Statement 2
/*Update Delhi Capitals's Head Coach because he stepped down 2 months after the season Ended*/

Update Team
Set HeadCoach = 'Hemang Badani' 
Where TeamName = 'Delhi Capitals' ;





-- GROUP BY Query 1 - Count number of players from each country
Select Country, Count (Country) as TotalPlayers 
From Player
Group by Country 
Order by Country;

-- GROUP BY Query 2 with Having Clause - Total Number of Players with a specific Bowling Style
Select BowlingStyle , Count(*) as TotalPlayers 
From Player
Group By BowlingStyle
Having Count (*) >=3 
Order By TotalPlayers Desc; 

--JOIN Query 1 Left Outer Join- Display batting stats even if player has none
Select Player.playerid, battingstats.Runs, battingstats.matchesplayed, battingstats.strikerate, battingstats.battingaverage
From battingstats
Left Outer Join player
ON BattingStats.playerid=player.playerid;



--JOIN Query 2 Right Outer Join- Match the winning team to Team ID
Select *
From Schedule
Right Outer Join Team
On Schedule.WinningTeamID=Team.TeamID;

--JOIN Query 3 Full Outer Join that lists all players even if they have No batting records

Select Player.PlayerID, BattingStats.Runs,BattingStats.BallsFaced, BattingStats.MatchesPlayed
From BattingStats
Full Outer Join Player
On Player.PlayerId=BattingStats.PlayerId;

--JOIN Query 4  Inner Join that lists Both Batting and Bowling Stats of Players (Matching IDs)
Select BattingStats.PlayerID, BattingStats.Runs, battingstats.strikerate, battingstats.battingaverage, bowlingstats.Wickets, bowlingStats.Economy
From BattingStats
Inner Join BowlingStats
On BattingStats.PlayerID= BowlingStats.PlayerID;

--Subquery for tracking all players that had a sold price greater than the average sold price
Select PlayerID, SoldPrice
From Auction
Where SoldPrice> (
    Select Avg(SoldPrice)
    From Auction
    Where SoldPrice is not null
    );

--Dynamic View for performance analysis

Create View PerformanceOverview AS
select
    player.playerid,
    player.playername,
    player.playerrole,
    player.battingstyle,
    player.bowlingstyle,
    Coalesce(battingstats.runs,0 ) as Runs,
    Coalesce (bowlingstats.wickets,0) as Wickets,
    Coalesce (battingstats.matchesplayed,bowlingstats.matchesplayed) as MatchesPlayed
From player
Left Join BattingStats on Player.PlayerID = BattingStats.PlayerID
Left Join BowlingStats on Player.PlayerID= BowlingStats.PlayerID;



-- Dyanamic View 2 for Coach Performance and effect on Team
Create view CoachPerformance  AS
Select
    Team.HeadCoach,
    Team.TeamName,
    PointsTable.MatchesPlayed, 
    PointsTable.MatchesWon, 
    PointsTable.MatchesLost,
    PointsTable.NetRunRate,
    PointsTable.PointsEarned
From Team
Join PointsTable on Team.TeamID=PointsTable.TeamID;

--Additional Last Minute Changes-> May affect what you have in the database currently

Alter table Schedule
Add constraint checkMatchType Check(MatchType in ('Playoff' ,'League', 'Eliminator', 'Qualifier1', 'Qualifier2' , 'Final')); 



Alter table Auction
Add constraint checkStatus Check(Status in ('Sold', 'Unsold','Injury Replacement-In 2024 Auction','Injury Replacement-Not In 2024 Auction', 'Withdrawn', 'Transferred' )); 

Alter table Player
Add constraint checkRole Check (PlayerRole in ( 'Batsman' , 'Bowler' , 'All-Rounder') );
Alter table Player
add constraint checkBattingStyle Check  (BattingStyle in ('Right Handed' , 'Left Handed' , 'Ambidextrous'));


Update Player
Set BowlingStyle = 'Right Arm Off Break'
Where PlayerName= 'Sameer Rizvi';

Alter table Player
add constraint checkBowlingStyle Check (BowlingStyle in 
( 'Right Arm Fast' , 'Right Arm Fast Medium' , 'Right Arm Medium Fast' , 'Right Arm Medium', 'Right Arm Off Break' ,'Right Arm Leg Spin' , 'Right Arm Leg Break' , 'Left Arm Fast', 'Left Arm Fast Medium' , 'Left Arm Medium Fast', 'Left Arm Medium', 'Left Arm Orthodox' , 'Left Arm Chinaman'));

Alter Table Auction 
Modify TeamID NULL; 



