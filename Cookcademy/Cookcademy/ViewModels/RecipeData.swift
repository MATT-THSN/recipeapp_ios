//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 14/07/2022.
//

import Foundation

class RecipeData: ObservableObject {
    @Published var recipes = Recipe.testRecipes
}
