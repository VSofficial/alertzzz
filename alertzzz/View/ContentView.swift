//
//  ContentView.swift
//  alertzzz
//
//  Created by Varun Sharma on 21/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ProfileCard(name: "Varun Sharma", email: "hii@gmail.com")
}
