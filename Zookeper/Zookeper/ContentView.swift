//
//  ContentView.swift
//  Zookeper
//
//  Created by Izel on 8/18/25.
//

import SwiftUI

struct ContentView: View {
   
   let animalGroups = [
    AnimalGroup(groupName: "Pets", animals: [
        Animal(name: "Dog"),
        Animal(name: "Cat"),
        Animal(name: "Fish"),
        Animal(name: "Bird")
    ]),
    AnimalGroup(groupName: "Farm", animals: [
        Animal(name: "Cow"),
        Animal(name: "Pig"),
        Animal(name: "Sheep"),
        Animal(name: "Goat")
    ])
    ,
    AnimalGroup(groupName: "Critters", animals: [
        Animal(name: "Firefly"),
        Animal(name: "Spider"),
        Animal(name: "Squirrel"),
        Animal(name: "Ant")
    ])
   ]
    
    var body: some View {
        VStack {
            Text("Hello Zookeper!").font(.headline)
            List {
                ForEach(animalGroups){ animalGroup in
                    Section(header: Text(animalGroup.groupName)){
                        ForEach(animalGroup.animals) { animal in
                            Text(animal.name)
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
        }
       
    }
}

struct Animal: Identifiable {
    var id = UUID()
    var name: String
}

struct AnimalGroup: Identifiable {
    var id = UUID()
    var groupName: String
    var animals: [Animal]
}




#Preview {
    ContentView()
}
