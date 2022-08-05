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
    
    // Should the sheet display?
    @State private var isPresenting = false
    @State private var newRecipe = Recipe()
    
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
        // Add a button to bring up the ModifyRecipeView (Sheet)
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    isPresenting = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        })
        // If presenting, bring up the sheet
        .sheet(isPresented: $isPresenting, content: {
            NavigationView {
                ModifyRecipeView(recipe: $newRecipe)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction) {
                            // Hide sheet without saving
                            Button("Dismiss") {
                                isPresenting = false
                            }
                        }
                        ToolbarItem(placement: .confirmationAction) {
                            // Add new recipe info to array of recipes
                            Button("Add") {
                                recipeData.recipe.append(newRecipe)
                                isPresenting = false
                            }
                        }
                    })
                    .navigationTitle("Add a New Recipe")
            }
        })
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
