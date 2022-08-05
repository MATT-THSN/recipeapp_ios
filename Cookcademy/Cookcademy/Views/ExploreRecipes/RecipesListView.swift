//
//  ContentView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 10/07/2022.
//

import SwiftUI

struct RecipiesListView: View {
    @EnvironmentObject private var recipeData: RecipeData
    let category: MainInformation.Category
    
    // Store background and text colour to be used in view.
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        // Display list of recipe names
        List {
            ForEach(recipes) { recipe in
                // Navigate to recipe details
                NavigationLink(recipe.mainInformation.name, destination: RecipeDetailView(recipe: recipe))
            }
            // Set row and text colours
            .listRowBackground(listBackgroundColor)
            .foregroundColor(listTextColor)
        }
        .navigationTitle(navigationTitle)
    }
}

extension RecipiesListView {
    // Give me all recipes
    private var recipes: [Recipe] {
        recipeData.recipes(for: category)
    }
    
    // What title do we want to use?
    private var navigationTitle: String {
        "\(category.rawValue) Recipes"
    }
}

struct RecipiesListView_Previews: PreviewProvider {
    static var previews: some View {
        // NavigationView added to display the navigationTitle.
        NavigationView {
            RecipiesListView(category: .breakfast)
                .environmentObject(RecipeData())
        }
    }
}
