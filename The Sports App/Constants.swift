//
//  Constants.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 12/06/2022.
//

import Foundation

// Storyboards
struct Storyboards {
    static let main = "Main"
}


// View Controllers
struct VCs {
    static let sportsVC = "sportsVC"
    static let LeagueVC = "leaguesVC"
    static let LeaguesDetailsVC = "LeaguesDetailsVC"
    static let TeamDetailsVC = "TeamDetailsVC"
    static let FavoriteLeagueVC = "FavoriteLeagueVC"
    static let teamDetailsVC = "teamDetailsVC"
}

struct URLs {
    // MARK:- base
    static let base = "https://www.thesportsdb.com/api/v1/json/2/"
    static let sports = "all_sports.php"
    static let leagus = "search_all_leagues.php?"
    static let events = "eventsseason.php?"
    static let teams  = "search_all_teams.php?"
}

struct cellNibName {
    static let sportCell  = "SportCell"
    static let leagueCell = "LeagueCell"
    static let upcomingEventsCell = "UpcomingEventsCell"
    static let latestResultCell = "LatestResultCell"
    static let teamsCell = "TeamsCell"
    static let eventsCell = "EventsCell"
    static let resultCell = "ResultCell"
    static let teamCell = "TeamCell"
    static let favLeagueCell = "FavLeagueCell"
}

struct cellIdentifierName {
    static let sportsCell    = "cell"
    static let leaguesCell   = "cell"
    static let upcomingEventsCell = "UpcomingEventsCell"
    static let latestResultCell = "LatestResultCell"
    static let teamsCell = "TeamsCell"
    static let eventsCell = "EventsCell"
    static let resultCell = "ResultCell"
    static let teamCell = "TeamCell"
    static let favLeagueCell = "FavLeagueCell"
}

struct viewControllerTitle {
    static let sportsVCTitle  = "Sports"
    static let leaguesVCTitle = "Leagues"
}

struct imagePlaceholder {
    static let placeholder = "placeholder"
}

struct entityNames {
    static let favoriteLeague = "FavouriteLeagues"
}
