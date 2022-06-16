//
//  LeagueDetailsVM.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 09/06/2022.
//

import Foundation
import Alamofire

class LeagueDetailsVM {
    
    
    var BindingParsingclouser : () -> Void = {}
    var checkDataClouser : () -> () = {}
    var eventsList = [Event]()
    var teamsList = [Team]()
    
    // Fetching All Events
    func getAllEvents (parameters: String) {
        let parameter : Parameters = ["id": parameters ]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?", method: .get , parameters: parameter)
            .responseData { response in
                switch response.result {
                case .success(let Value):
                    do {
                        let allEvents = try JSONDecoder().decode(Events.self, from: Value )
                        self.eventsList = allEvents.events ?? []
                        if allEvents.events == nil {
                            self.checkDataClouser()
                        }
                        for event in allEvents.events ?? [] {
                            if event.strEvent == nil  {
                                self.checkDataClouser()
                            }
                            else if event.strHomeTeam == nil && event.strAwayTeam == nil {
                                self.checkDataClouser()
                            }
                        }
                        self.BindingParsingclouser()
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
    
    // Fetching All Teams
    func getAllTeams (parameters: String) {
        let parameter : Parameters = ["l": parameters ]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?", method: .get , parameters: parameter)
            .responseData { response in
                switch response.result {
                case .success(let Value):
                    do {
                        let allTemas = try JSONDecoder().decode(Teams.self, from: Value )
                        self.teamsList = allTemas.teams ?? []
                        if allTemas.teams == nil {
                            self.checkDataClouser()
                        }
                        for team in allTemas.teams ?? [] {
                            if team.strTeamBadge == nil {
                                self.checkDataClouser()
                            }
                        }
                        self.BindingParsingclouser()
                    } catch let error {
                        print(error)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }
}
