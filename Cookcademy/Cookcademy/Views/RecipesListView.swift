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
            ForEach(recipeData.recipes) { recipe in
                Text(recipe.mainInformation.name)
            }
        }
        .navigationTitle("All Recipes")
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
