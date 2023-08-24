//
//  Cards.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

struct CardsGastos: View {
    
    var observacion: String
    var emisor: String
    var autor: String
    var importeFinal: String
    var importeSolicitado: String
    
    var body: some View {
        VStack{
            HStack{
                Text(observacion)
            }
            .padding(.vertical, 5)
            .bold()
            .font(.headline)
            .foregroundColor(.black)
            
            HStack {
                Text("Importe Solicitado: ")
                Text("$\(importeSolicitado)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.vertical, 5)
            .foregroundColor(.cyan)
            
            HStack {
                Text("Importe final: ")
                Text("$\(importeFinal)")
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.vertical, 5)
            .foregroundColor(.green)
            
            HStack {
                Text("Emisor: ")
                Text(emisor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.vertical, 5)
            .foregroundColor(.black.opacity(0.8))
            
            HStack {
                Text("Solicita: ")
                Text(autor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(.vertical, 5)
            .foregroundColor(.black.opacity(0.8))
        }
        .padding()
        .font(.body)
        .fontWeight(.light)
        .background(Color.white)
        .cornerRadius(20)
    }
}
