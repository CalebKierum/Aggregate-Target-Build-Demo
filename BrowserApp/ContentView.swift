//
//  ContentView.swift
//  BrowserApp
//
//  Created by Caleb Kierum on 8/4/25.
//

import SwiftUI

struct ContentView: View {
    
    var debug: String {
        return """
        1: \(Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "build"))
        2: \(Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "build"))
        3: \(Bundle.path(forResource: "index", ofType: "html", inDirectory: "build"))
        4: \(Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: nil))
        """
    }
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(debug)
        }
        .padding()
        .onAppear {
            
        }
    }
}

#Preview {
    ContentView()
}
