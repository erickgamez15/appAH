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
            Section(header: Text("Salidas").font(.title).fontWeight(.semibold).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
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
                    
                    HStack{
                        Text("Total Salidas: ")
                        Text(value)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 10)
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
