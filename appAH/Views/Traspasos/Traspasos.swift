//
//  Traspasos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct Traspasos: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack() {
                    
                    //Cards de Traspasos
                    CardsTraspasos()
                    
                    VStack{
                        
                    }.padding(.bottom, 20)
                }
                .padding(.top, 30)
                .padding(.horizontal, 15)
            }
            .background(Color.white)
            .cornerRadius(25)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Traspasos")
                        .font(.title2)
                        .bold()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                    }
                    .accentColor(.black)
                }
            }
            .padding(.top, -40.0)
        }
    }
}

struct Traspasos_Previews: PreviewProvider {
    static var previews: some View {
        Traspasos()
    }
}
