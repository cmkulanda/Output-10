//
//  ContentView.swift
//  Output 10
//
//  Created by Scholar on 4/19/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    // 🧐 Hmm will 'name' always stay constant as a variable? If not, what keyword(s) can we use instead to declare 'name' as a variable that can be updated by the user's input?
    
    @State private var food: String = ""
    @State private var showAlert = false
    // 🔥 Ooh the property wrappers you added to your variables look great!
    // 🙈 I especially like how you set showAlert initially to false, so our user doesn't get the alert before entering their name & fav food
    
    var body: some View {
        VStack {
            Text("Tell us about yourself!")
                .font(.title)
            
            // Nice job setting up the two-way binding in both of your TextFields!
            
            // 💡 Tip: Don't forget to add the '$' before the variable name! It will tell SwiftUI to read the value from name, and if it changes, to update it automatically with the value from TextField.
            TextField("Enter name", text: $name)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            // 😋 Instead of 'good,' did you mean food?
            TextField("Favorite food", text: $food)
                .textFieldStyle(.roundedBorder)
                .padding()

            Button("Submit") {
                // 👀 Right now, our 'showAlert' variable is still set to false. What should we do to allow the alert to appear after the user clicks Submit? Where should we put it?
                showAlert = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.purple)
            // ❤️ The syntax for the .alert() is so solid! I love how you updated the information for the Button and binded showAlert.
            // 💡 Tip: Try using single backslashes for string interpolation!
            .alert("Thanks, \(name)! We now know your favorite food is \(food)!", isPresented: $showAlert) {
                Button("OK", role: .cancel) { }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
