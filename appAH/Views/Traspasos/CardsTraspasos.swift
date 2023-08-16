//
//  CardsTraspasos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

struct CardsTraspasos: View {
    
    @State var text = "Para turno de la noche"
    
    var body: some View {
        Group{
            Section{
                VStack{
                    HStack{
                        Text("Nota: \(text)")
                    }
                    .foregroundColor(.black)
                    
                    HStack {
                        Text("Solicita: \(text)")
                    }
                    .foregroundColor(.black)
                    HStack{
                        Button(action: {
                            
                        }) {
                            Image(systemName: "chevron.down")
                        }
                        .bold()
                        .padding(.top, 1)
                        .foregroundColor(.red)
                        .cornerRadius(5)
                    }
                }
                .padding()
                .padding(.horizontal)
                .font(.body)
                .fontWeight(.light)
                .background(Color.white)
                .cornerRadius(20)
            }
            .padding(.top)
        }
    }
}
