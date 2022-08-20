//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 20/08/2022.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State var newIngredient = Ingredient()
    
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    var body: some View {
        NavigationView {
            VStack {
                let addIngredientView = ModifyIngredientView(ingredient: $newIngredient) { ingredient in
                        ingredients.append(ingredient)
                        newIngredient = Ingredient()
                      }.navigationTitle("Add Ingredient")
                if ingredients.isEmpty {
                    Spacer()
                    NavigationLink("Add the first ingredient", destination: addIngredientView)
                    Spacer()
                } else {
                    List {
                        ForEach(ingredients.indices, id: \.self) { index in
                            let ingredients = ingredients[index]
                            Text(ingredients.description)
                        }
                        .listRowBackground(listBackgroundColor)
                        NavigationLink("Add another ingredients", destination: addIngredientView)
                            .buttonStyle(.plain)
                            .listRowBackground(listBackgroundColor)
                    }
                    //.navigationTitle("Ingredients")
                    .foregroundColor(listTextColor)
                }
            }
        }
    }
}

struct ModifyIngredientsView_Previews: PreviewProvider {
    @State static var emptyIngredients = [Ingredient]()
    static var previews: some View {
        NavigationView {
            ModifyIngredientsView(ingredients: $emptyIngredients)
        }
    }
}
