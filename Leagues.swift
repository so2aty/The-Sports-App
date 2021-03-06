//
//  Leagues.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 06/06/2022.
//

import Foundation

// MARK: - Leagues
struct Leagues : Codable {
    let countries : [League]
}
// MARK: - League
struct League : Codable {
    let idLeague : String?
    let idSoccerXML : String?
    let idAPIfootball : String?
    let strSport : String?
    let strLeague : String?
    let strLeagueAlternate : String?
    let intDivision : String?
    let idCup : String?
    let strCurrentSeason : String?
    let intFormedYear : String?
    let dateFirstEvent : String?
    let strGender : String?
    let strCountry : String?
    let strWebsite : String?
    let strFacebook : String?
    let strInstagram : String?
    let strTwitter : String?
    let strYoutube : String?
    let strRSS : String?
    let strDescriptionEN : String?
    let strDescriptionDE : String?
    let strDescriptionFR : String?
    let strDescriptionIT : String?
    let strDescriptionCN : String?
    let strDescriptionJP : String?
    let strDescriptionRU : String?
    let strDescriptionES : String?
    let strDescriptionPT : String?
    let strDescriptionSE : String?
    let strDescriptionNL : String?
    let strDescriptionHU : String?
    let strDescriptionNO : String?
    let strDescriptionPL : String?
    let strDescriptionIL : String?
    let strTvRights : String?
    let strFanart1 : String?
    let strFanart2 : String?
    let strFanart3 : String?
    let strFanart4 : String?
    let strBanner : String?
    let strBadge : String?
    let strLogo : String?
    let strPoster : String?
    let strTrophy : String?
    let strNaming : String?
    let strComplete : String?
    let strLocked : String?


    enum CodingKeys: String, CodingKey {

        case idLeague = "idLeague"
        case idSoccerXML = "idSoccerXML"
        case idAPIfootball = "idAPIfootball"
        case strSport = "strSport"
        case strLeague = "strLeague"
        case strLeagueAlternate = "strLeagueAlternate"
        case intDivision = "intDivision"
        case idCup = "idCup"
        case strCurrentSeason = "strCurrentSeason"
        case intFormedYear = "intFormedYear"
        case dateFirstEvent = "dateFirstEvent"
        case strGender = "strGender"
        case strCountry = "strCountry"
        case strWebsite = "strWebsite"
        case strFacebook = "strFacebook"
        case strInstagram = "strInstagram"
        case strTwitter = "strTwitter"
        case strYoutube = "strYoutube"
        case strRSS = "strRSS"
        case strDescriptionEN = "strDescriptionEN"
        case strDescriptionDE = "strDescriptionDE"
        case strDescriptionFR = "strDescriptionFR"
        case strDescriptionIT = "strDescriptionIT"
        case strDescriptionCN = "strDescriptionCN"
        case strDescriptionJP = "strDescriptionJP"
        case strDescriptionRU = "strDescriptionRU"
        case strDescriptionES = "strDescriptionES"
        case strDescriptionPT = "strDescriptionPT"
        case strDescriptionSE = "strDescriptionSE"
        case strDescriptionNL = "strDescriptionNL"
        case strDescriptionHU = "strDescriptionHU"
        case strDescriptionNO = "strDescriptionNO"
        case strDescriptionPL = "strDescriptionPL"
        case strDescriptionIL = "strDescriptionIL"
        case strTvRights = "strTvRights"
        case strFanart1 = "strFanart1"
        case strFanart2 = "strFanart2"
        case strFanart3 = "strFanart3"
        case strFanart4 = "strFanart4"
        case strBanner = "strBanner"
        case strBadge = "strBadge"
        case strLogo = "strLogo"
        case strPoster = "strPoster"
        case strTrophy = "strTrophy"
        case strNaming = "strNaming"
        case strComplete = "strComplete"
        case strLocked = "strLocked"
    }
}


