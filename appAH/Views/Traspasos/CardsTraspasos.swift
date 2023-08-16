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
                    .padding()
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    
                    HStack {
                        Text("Solicita: \(text)")
                    }
                    .padding()
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                }
                .padding()
                .background(
                    LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink, Color.red, Color.orange, Color.yellow]), startPoint: .bottomLeading, endPoint: .topTrailing)
                )
                .cornerRadius(20)
            }
            .shadow(color: .black.opacity(0.3), radius: 5)
        }
    }
}
