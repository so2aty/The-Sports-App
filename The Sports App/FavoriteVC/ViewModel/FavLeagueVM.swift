//
//  FavCoreData.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 15/06/2022.
//

import UIKit
import CoreData

class FavLeagueVM {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var League: NSManagedObject?
    var leaguesList = [CoreDataLeague]()
    
    static let instance = FavLeagueVM()
    
 
// MARK: - Load Data form Data-Base ( CoreData )
    
    func getData () -> [CoreDataLeague] {
        leaguesList.removeAll()
        let viewContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityNames.favoriteLeague)
        
        do {
            let leagues = try viewContext.fetch(fetchRequest)
            //            print("Count: \(leagues.count)")
            
            for league in leagues {
                //                print(league.value(forKey: "strLeague") ?? "")
                //                print("------------------")
                let favLeagueModel = CoreDataLeague.init(league: league)
                leaguesList.append(favLeagueModel)
            }
            
            return leaguesList
            
        } catch let error {
            print(error.localizedDescription)
            return []
        }
    }

// MARK: - Add Data to Data-Base using CoreData
    
    func addDataToCoreData (strLeague: String ,strBadge: String ,strYoutube: String , idLeague: String) {
        let viewContext = appDelegate.persistentContainer.viewContext
        
        guard let entity = NSEntityDescription.entity(forEntityName: entityNames.favoriteLeague,in: viewContext) else { return }
        
        let league = NSManagedObject(entity: entity,insertInto: viewContext)
        
        league.setValue(strLeague, forKey: "strLeague")
        league.setValue(strBadge, forKey: "strBadge")
        league.setValue(strYoutube, forKey: "strYoutube")
        league.setValue(idLeague, forKey: "idLeague")
        
        appDelegate.saveContext()
        
        do {
            try viewContext.save()
        } catch let error {
            print(error.localizedDescription)
        }
        //       print("Done")
    }
    
// MARK: - Delete Data form Data-Base
    func deletLeague (index : Int) {
        let viewContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: entityNames.favoriteLeague)
        do {
            let leagues = try viewContext.fetch(fetchRequest)
        //        print("Count: \(leagues.count)")
            League = leagues[index]
        }
        catch let error {
            print(error.localizedDescription)
        }
        viewContext.delete(League!)
        appDelegate.saveContext()
        //        print("Delete")
    }
}
    

