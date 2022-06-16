//
//  LeaguesViewModel.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 08/06/2022.
//

import Foundation
import Alamofire
import UIKit


class LeaguesViewModel {
    
    var BindingParsingclouser : () -> Void = {}
    var leaguesList = [League]()
    
    // Fetching Leagues Data Method
    func getAllLeagues ( parameters : String) {
        let parameter : Parameters = ["s": parameters]
        AF.request("https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?", method: .get , parameters: parameter)
            .responseData { response in
                switch response.result {
                case .success(let Value):
                    do {
                        let leagues = try JSONDecoder().decode(Leagues.self, from: Value )
//                      print(leagues, leagues.countries ?? "", leagues.countries.first?.idLeague)
                        self.leaguesList = leagues.countries
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


