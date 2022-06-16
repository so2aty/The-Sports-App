//
//  Sports.swift
//  The Sports App
//
//  Created by Mohamed Azooz on 05/06/2022.
//

import Foundation

// MARK: - Sports
struct Sports: Codable {
    let sports: [Sport]
}

// MARK: - Sport
struct Sport: Codable {
    let idSport: String
    let strSport: String
    let strFormat: String
    let strSportThumb: String
    let strSportIconGreen: String
    let strSportDescription: String
}

