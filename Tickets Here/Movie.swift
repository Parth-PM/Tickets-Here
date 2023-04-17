//
//  Movie.swift
//  Tickets Here
//
//  Created by Parth Maru on 2023-04-15.
//

import Foundation
struct Movie {
    var id = UUID().uuidString
    var name: String
    var imageName: String
    var director: String
    var cast: String
    var length: String
    var date: String
    var type: String
    var plot: String
}
