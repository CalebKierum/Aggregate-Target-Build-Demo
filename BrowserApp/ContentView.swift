//
//  ContentView.swift
//  BrowserApp
//
//  Created by Caleb Kierum on 8/4/25.
//

import SwiftUI

struct ContentView: View {
    
    // Convenience method to check if path exists and return path + contents
    func checkPathAndContents(for pathResult: Any?, label: String) -> String {
        guard let pathResult = pathResult else {
            return "\(label): Path not found"
        }
        
        var actualPath: String?
        
        if let url = pathResult as? URL {
            actualPath = url.path
        } else if let path = pathResult as? String {
            actualPath = path
        }
        
        guard let path = actualPath, FileManager.default.fileExists(atPath: path) else {
            return "\(label): Path exists but file not found at \(pathResult)"
        }
        
        do {
            let contents = try String(contentsOfFile: path, encoding: .utf8)
            let cleanedContents = contents.replacingOccurrences(of: "\n", with: " ").replacingOccurrences(of: "\r", with: " ")
            return """
            \(label): ✅ Found at: \(path)
            Contents: \(cleanedContents.prefix(200))...
            """
        } catch {
            return "\(label): ✅ Path exists at \(path) but failed to read contents: \(error.localizedDescription)"
        }
    }
    
    var debug: String {
        let path1 = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "build")
        let path2 = Bundle.main.path(forResource: "index", ofType: "html", inDirectory: "build")
        let path3 = Bundle.path(forResource: "index", ofType: "html", inDirectory: "build")
        let path4 = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: nil)
        
        return """
        \(checkPathAndContents(for: path1, label: "1"))
        
        \(checkPathAndContents(for: path2, label: "2"))
        
        \(checkPathAndContents(for: path3, label: "3"))
        
        \(checkPathAndContents(for: path4, label: "4"))
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
