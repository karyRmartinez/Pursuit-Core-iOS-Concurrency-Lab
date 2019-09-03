//
//  countriesListFile.swift
//  Concurrency-Lab
//
//  Created by Kary Martinez on 9/3/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import Foundation

enum JSONError: Error {
    case decodingError(Error)
}

struct CountriesListMode: Codable {
    let name: [nameWrapper]
}

struct nameWrapper: Codable {
    let name: String
  
    
    static func getCountriesList(from data: Data) throws -> [nameWrapper] {
        do {
            let name = try JSONDecoder().decode(CountriesListMode.self, from: data)
            return name.name
        } catch {
            throw JSONError.decodingError(error)
        }
        
    }
}


