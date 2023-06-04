//
//  HomeView.swift
//  BrainMath
//
//  Created by G Zhen on 6/1/23.
//

import SwiftUI

struct HomeView: View {
    let tintGradient = Gradient(colors: [.pink, .red])
    
    var body: some View {
        TabView {
            TrainView()
            .tabItem {
                Label("Train", systemImage: "graduationcap.circle")
            }
            QuestView()
            .tabItem {
                Label("Quest", systemImage: "trophy.circle")
            }
            SettingView()
            .tabItem {
                Label("Setting", systemImage: "gearshape.2")
            }
        }
        .tint(.accentColor)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
