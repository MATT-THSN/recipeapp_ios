//
//  ModifyMainInformationView.swift
//  Cookcademy
//
//  Created by Matthew Thompson on 17/08/2022.
//

import SwiftUI

struct ModifyMainInformationView: View {
    private let listBackgroundColor = AppColor.background
    private let listTextColor = AppColor.foreground
    
    @Binding var mainInformation: MainInformation
    
    var body: some View {
        Form {
            TextField("Recipe Name", text: $mainInformation.name)
            TextField("Author", text: $mainInformation.author)
            Section(header: Text("Description")) {
                TextEditor(text: $mainInformation.description)
            }
            Picker(selection: $mainInformation.category, label:
                HStack {
                    Text("Category")
                    Spacer()
                    Text(mainInformation.category.rawValue)
                }, content: {
                ForEach(MainInformation.Category.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            })
            .pickerStyle(.menu)
        }
    }
}

struct ModifyMainInformationView_Previews: PreviewProvider {
    @State static var mainInformation = MainInformation(name: "Test Name",
                                                            description: "Test Description",
                                                            author: "Test Author",
                                                            category: .breakfast)
    
    @State static var emptyInformation = MainInformation(name: "", description: "", author: "", category: .breakfast)

    static var previews: some View {
        ModifyMainInformationView(mainInformation: $mainInformation)
        ModifyMainInformationView(mainInformation: $emptyInformation)
    }
}
