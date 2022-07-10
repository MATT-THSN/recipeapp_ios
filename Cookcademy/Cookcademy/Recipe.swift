//
//  Recipe.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 10/07/2022.
//

import Foundation

// Hold Recipe Information
struct Recipe {
    var mainInformation: MainInformation
    var ingredients: [String]
    var directions: [String]
}

// Hold Main Data for Recipe
struct MainInformation {
    var name: String
    var description: String
    var author: String
    var category: Category // Breakfast, Lunch, Dinner, Desert
    
    enum Category: String, CaseIterable {
        case breakfast = "Breakfast"
        case lunch = "Lunch"
        case dinner = "Dinner"
        case dessert = "Dessert"
    }
}

