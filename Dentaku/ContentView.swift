//
//  ContentView.swift
//  Dentaku
//
//  Created by 広瀬友哉 on 2023/07/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NumeberPadView(btnWidth: 0)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
