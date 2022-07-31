//
//  RecipeData.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 14/07/2022.
//

import Foundation

class RecipeData: ObservableObject {
    // We use @Published here so SwiftUI make display changes should recipes change
  @Published var recipe = Recipe.testRecipes
 
  func recipes(for category: MainInformation.Category) -> [Recipe] {
    var filteredRecipes = [Recipe]()
    for item in recipe {
      if item.mainInformation.category == category {
        filteredRecipes.append(item)
      }
    }
    return filteredRecipes
  }
}
