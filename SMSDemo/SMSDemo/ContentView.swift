//
//  ContentView.swift
//  SMSDemo
//
//  Created by Runhua Huang on 2025/10/17.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""

    var body: some View {
      TextField("Text Field", text: $username)
            .textContentType(.oneTimeCode)
            .keyboardType(.numberPad)
    }
}

#Preview {
    ContentView()
}
