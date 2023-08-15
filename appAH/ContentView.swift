//
//  ContentView.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            Inicio()
            .tabItem{
                Image(systemName: "house.circle.fill")
                Text("Inicio")
            }
            .edgesIgnoringSafeArea(.top)
            
            Dinero()
            .tabItem{
                Image(systemName: "dollarsign.circle.fill")
                Text("Dinero")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
