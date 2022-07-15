//
//  ContentView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 10/07/2022.
//

import SwiftUI

struct RecipiesListView: View {
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        // Display list of recipe names
        List {
            ForEach(recipes) { recipe in
                Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle("All Recipes")
    }
}

extension RecipiesListView {
    // Give me all recipes
    var recipes: [Recipe] {
        recipeData.recipes
    }
}

struct RecipiesListView_Previews: PreviewProvider {
    static var previews: some View {
        // NavigationView added to display the navigationTitle.
        NavigationView {
            RecipiesListView()
        }
    }
}