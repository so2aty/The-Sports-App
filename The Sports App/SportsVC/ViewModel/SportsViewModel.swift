//
//  SportsViewModel.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 07/06/2022.
//

import Foundation
import Alamofire

class SportsViewModel {
    
    var BindingParsingclouser : () -> Void = {}
    
    var sportsList = [Sport]()
    
    // Fetching Sports Data Method
    func getAllSports () {
        AF.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php", method: .get)
            .responseData { response in
                switch response.result {
                case .success(let Value):
                    do {
                        let sports = try JSONDecoder().decode(Sports.self, from: Value )
                     //   print(sports, sports.sports ?? "", sports.sports.first?.idSport)
                        self.sportsList = sports.sports
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
