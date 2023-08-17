//
//  Egresos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

struct Egresos: View {
    
    @State var value = "88888888.80"
    
    var body: some View {
        
        Group{
            Section(
                header: Text("Salidas")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom, 5.0)
                    .padding(.top, 30)
            ){
                VStack(alignment: .leading){
                    HStack{
                        Label("Gastos: ", systemImage: "dollarsign")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Devoluciones Cancelaciones: ", systemImage: "arrow.counterclockwise")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Sueldos: ", systemImage: "person.2")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Vales: ", systemImage: "tag")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Importe de Bonificación: ", systemImage: "doc.text")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Suministros: ", systemImage: "cart")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    HStack{
                        Label("Préstamos: ", systemImage: "calendar")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
                    
                    Divider() //Linea divisora
                    
                    HStack{
                        Text("Total Salidas: ")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.top, 10)
                    .bold()
                    .foregroundColor(.red)
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
