//
//  Recipe.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 10/07/2022.
//

// *************************************************************************************************************************************
// *  The Recipe model contains  custom structures that hold the recipe’s Ingredients, Directions, and some relevant MainInformation.  *
// *************************************************************************************************************************************


import Foundation

// Hold Recipe Information
struct Recipe {
    var mainInformation: MainInformation
    var ingredients: [Ingredient]
    var directions: [Direction]
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

// Hold Ingredient Details
struct Ingredient {
    var name: String
    var quantity: Double
    var unit: Unit // Ounces, Grams, Cups, Tablespoons, Teaspoons, None

    enum Unit: String, CaseIterable {
        case oz = "Ounces"
        case g = "Grams"
        case cups = "Cups"
        case tbs = "Tablespoons"
        case tsp = "Teaspoons"
        case none = "No units"
    }
}

// Hold Direction(s) for Recipe
struct Direction {
    var description: String
    var isOptional: Bool
}

