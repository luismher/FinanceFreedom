//
//  CreateForm.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/13/24.
//

import SwiftUI

struct CreateForm: View {
    @State private var test = ""
    @State private var date = Date()
    @State private var notes = ""
    @State private var types = ["Income", "Expense"]
    @State private var category = ["Food", "Gas", "Grocery", "Trips", "Vacation", "Rent"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("New Entry")){
                    
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    Picker("Type", selection: $test) {
                        ForEach(0 ..< types.count) {
                            Text(self.types[$0]).tag($0)
                        }
                    }
                    Picker("Category", selection: $test) {
                        ForEach(0 ..< category.count) {
                            Text(self.category[$0]).tag($0)
                        }
                    }
                    TextField("Type Amount", text: $test)
                        .multilineTextAlignment(.trailing)
                }
                Section(header: Text("Notes")){
                    TextEditor(text: $notes)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        .background(Color.gray.opacity(0.1))
                        .frame(minHeight: 220)
                        .padding()
                }
            }
            .navigationTitle("Create")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button("Cancel"){}
                    Button("Save"){}
                }
            }
        }
    }
}

#Preview {
    CreateForm()
}
