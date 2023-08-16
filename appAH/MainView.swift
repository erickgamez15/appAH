//
//  MainView.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct MainView: View {
    
    @State private var selectedTab: Int = 0
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            Inicio()
                .tabItem {
                    Label("Inicio", systemImage: "house.circle.fill")
                }
                .edgesIgnoringSafeArea(.top)
                .tag(0)
            
            Gastos()
                .tabItem {
                    Label("Gastos", systemImage: "dollarsign.circle.fill")
                }
                .edgesIgnoringSafeArea(.top)
                .tag(1)
            
            Traspasos()
                .tabItem {
                    Label("Traspasos", systemImage: "arrow.right.arrow.left.circle.fill")
                }
                .edgesIgnoringSafeArea(.top)
                .tag(2)
        }
        .accentColor(.red)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
