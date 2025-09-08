//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Izel on 9/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack (spacing:0) {
                LinearGradient(
                       gradient: Gradient(colors: [.teal, .white]),
                       startPoint: .top,
                       endPoint: .bottom
                   )
            }
            
            VStack(spacing:10) {
                //
                Button("Button 1"){}.buttonStyle(.bordered)
                //
                Button("Button 2", role: .destructive){}.buttonStyle(.bordered)
                //
                Button("Button 3"){}.buttonStyle(.borderedProminent).tint(.mint)
                //
                Button("Button 4", role: .destructive){}.buttonStyle(.borderedProminent)
                //
                Button {
                    print("Edit button tapped")
                } label: {
                    Image(systemName: "pencil")
                }
                //
                Button("Edit", systemImage: "pencil") {
                    print("Button tapped")
                }
                
            }
            
        }.ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
