//
//  Cards.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

struct CardsGastos: View {
    
    @State var valueVentas = "8888888.88"
    @State var text = "Compra de alimentos Miércoles y Jueves"
    @State var textName = "FELICITAS GARCÍA CASTRO"
    
    var body: some View {
        Group{
            Section{
                VStack{
                    HStack{
                        Text(text)
                    }
                    .padding(.vertical, 5)
                    .bold()
                    .font(.headline)
                    .foregroundColor(.black)
                    
                    HStack {
                        Text("Importe Solicitado: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    .foregroundColor(.orange)
                    
                    HStack {
                        Text("Importe final: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    .foregroundColor(.green)
                    
                    HStack {
                        Text("Emisor: ")
                        Text(textName)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    .foregroundColor(.black.opacity(0.8))
                    
                    HStack {
                        Text("Solicita: ")
                        Text(textName)
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
    }
}
