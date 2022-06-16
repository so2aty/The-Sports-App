//
//  CoreDataLeague.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 15/06/2022.
//

import Foundation
import CoreData

// MARK: - CoreDataLeague
struct CoreDataLeague : Codable {
    
    let strLeague : String?
    let strYoutube : String?
    let strBadge : String?
    let idLeague : String
    
    
    init(strLeague: String, strYoutube: String, strBadge: String , idLeague: String) {
        self.strLeague = strLeague
        self.strYoutube = strYoutube
        self.strBadge = strBadge
        self.idLeague = idLeague
    }
    
    init(league: NSManagedObject) {
        self.strLeague = league.value(forKey: "strLeague") as? String ?? ""
        self.strYoutube = league.value(forKey: "strYoutube") as? String ?? ""
        self.strBadge = league.value(forKey: "strBadge") as? String ?? ""
        self.idLeague = league.value(forKey: "idLeague") as? String ?? ""
    }
}
