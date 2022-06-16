//
//  LeagueDetailsModel.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 09/06/2022.
//

import Foundation

// MARK: - Events
struct Events: Codable {
    let events: [Event]?
}

// MARK: - Event
struct Event: Codable {

    let idEvent: String?
    let idSoccerXML: String?
    let idAPIfootball: String?
    let strEvent: String?
    let strEventAlternate: String?
    let strFilename: String?
    let strSport: String?
    let idLeague: String?
    let strLeague: String?
    let strSeason: String?
    let strDescriptionEN: String?
    let strHomeTeam: String?
    let strAwayTeam: String?
    let intHomeScore: String?
    let intRound: String?
    let intAwayScore: String?
    let intSpectators: String??
    let strOfficial: String?
    let strTimestamp: String?
    let dateEvent: String?
    let dateEventLocal: String?
    let strTime: String?
    let strTimeLocal: String?
    let strTVStation: String?
    let idHomeTeam: String?
    let idAwayTeam: String?
    let intScore: String?
    let intScoreVotes: String?
    let strResult: String?
    let strVenue: String?
    let strCountry: String?
    let strCity: String?
    let strPoster: String?
    let strSquare: String?
    let strFanart: String?
    let strThumb: String?
    let strBanner: String?
    let strMap: String?
    let strTweet1: String?
    let strTweet2: String?
    let strTweet3: String?
    let strVideo: String?
    let strStatus: String?
    let strPostponed: String?
    let strLocked: String?

    private enum CodingKeys: String, CodingKey {
        case idEvent = "idEvent"
        case idSoccerXML = "idSoccerXML"
        case idAPIfootball = "idAPIfootball"
        case strEvent = "strEvent"
        case strEventAlternate = "strEventAlternate"
        case strFilename = "strFilename"
        case strSport = "strSport"
        case idLeague = "idLeague"
        case strLeague = "strLeague"
        case strSeason = "strSeason"
        case strDescriptionEN = "strDescriptionEN"
        case strHomeTeam = "strHomeTeam"
        case strAwayTeam = "strAwayTeam"
        case intHomeScore = "intHomeScore"
        case intRound = "intRound"
        case intAwayScore = "intAwayScore"
        case intSpectators = "intSpectators"
        case strOfficial = "strOfficial"
        case strTimestamp = "strTimestamp"
        case dateEvent = "dateEvent"
        case dateEventLocal = "dateEventLocal"
        case strTime = "strTime"
        case strTimeLocal = "strTimeLocal"
        case strTVStation = "strTVStation"
        case idHomeTeam = "idHomeTeam"
        case idAwayTeam = "idAwayTeam"
        case intScore = "intScore"
        case intScoreVotes = "intScoreVotes"
        case strResult = "strResult"
        case strVenue = "strVenue"
        case strCountry = "strCountry"
        case strCity = "strCity"
        case strPoster = "strPoster"
        case strSquare = "strSquare"
        case strFanart = "strFanart"
        case strThumb = "strThumb"
        case strBanner = "strBanner"
        case strMap = "strMap"
        case strTweet1 = "strTweet1"
        case strTweet2 = "strTweet2"
        case strTweet3 = "strTweet3"
        case strVideo = "strVideo"
        case strStatus = "strStatus"
        case strPostponed = "strPostponed"
        case strLocked = "strLocked"
    }
    
}
