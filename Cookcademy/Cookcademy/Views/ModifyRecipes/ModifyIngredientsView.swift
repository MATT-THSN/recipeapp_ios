//
//  ModifyIngredientsView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 20/08/2022.
//

import SwiftUI

struct ModifyIngredientsView: View {
    @Binding var ingredients: [Ingredient]
    @State var newIngredient = Ingredient(name: "",
                                          quantity: 0.0,
                                          unit: .none)
    
    var body: some View {
        if ingredients.isEmpty {
            Spacer()
            NavigationLink("Add the first ingredient", destination: ModifyIngredientView(ingredient: $newIngredient))
            Spacer()
        } else {
            List {
                ForEach(ingredients.indices, id: \.self) { index in
                    let ingredients = ingredients[index]
                    Text(ingredients.description)
                }
                NavigationLink("Add another ingredients", destination: ModifyIngredientView(ingredient: $newIngredient))
                    .buttonStyle(.plain)
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
