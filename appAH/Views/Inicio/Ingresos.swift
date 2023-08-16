//
//  Ingresos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

struct Ingresos: View {
    
    @State var value = "88888888.80"
    
    var body: some View {
        
        Group{
            Section(header: Text("Entradas").font(.title).fontWeight(.semibold).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
                VStack(){
                    HStack{
                        Label("Efectivo: ", systemImage: "dollarsign")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Tarjetas: ", systemImage: "creditcard")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Créditos: ", systemImage: "percent")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Monedas: ", systemImage: "dollarsign.circle")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Transferencia: ", systemImage: "arrow.right.arrow.left")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Cheques: ", systemImage: "doc.text")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Otros: ", systemImage: "questionmark.circle")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Pagos de notas de otras fechas: ", systemImage: "calendar")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Text("Total Entradas: ")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .bold()
                    .foregroundColor(.green)
                }
                .padding()
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
    }
}
