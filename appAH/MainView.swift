//
//  ContentView.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Inicio()
            .tabItem{
                Image(systemName: "house.circle.fill")
                Text("Inicio")
            }
            .edgesIgnoringSafeArea(.top)
            
            Gastos()
            .tabItem{
                Image(systemName: "dollarsign.circle.fill")
                Text("Gastos")
            }
            .edgesIgnoringSafeArea(.top)
            
            Transacciones()
            .tabItem{
                Image(systemName: "arrow.right.arrow.left.circle.fill")
                Text("Traspasos")
            }
            .background(Color.white)
            .edgesIgnoringSafeArea(.top)
        }
        .accentColor(.red)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
