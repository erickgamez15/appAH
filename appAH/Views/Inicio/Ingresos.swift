//
//  Ingresos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

//Vista que muestra el desgloce de la Entradas
struct Ingresos: View {
    
    @State var value = "88888888.80"
    
    var body: some View {
        
        Group{
            Section(
                header: Text("Entradas")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom, 5.0)
                    .padding(.top, 30)
            ){
                VStack{
                    HStack{
                        Label("Efectivo: ", systemImage: "dollarsign")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Tarjetas: ", systemImage: "creditcard")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Créditos: ", systemImage: "percent")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Monedas: ", systemImage: "dollarsign.circle")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Transferencia: ", systemImage: "arrow.right.arrow.left")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Cheques: ", systemImage: "doc.text")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Otros: ", systemImage: "questionmark.circle")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    HStack{
                        Label("Pagos de notas de otras fechas: ", systemImage: "calendar")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 5)
                    
                    Divider()
                    
                    HStack{
                        Text("Total Entradas: ")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.top, 10)
                    .bold()
                    .foregroundColor(.green)
                }//End VStack
                .padding()
                .font(.body)
                .fontWeight(.light)
                .foregroundColor(.black)
                .background(Color.white)
                .cornerRadius(20)
            }//End Section
        }//End Group
    }//End body
}//End View
