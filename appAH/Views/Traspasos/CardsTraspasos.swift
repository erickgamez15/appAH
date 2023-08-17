//
//  CardsTraspasos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

struct CardsTraspasos: View {
    
    @State var text = "Para turno de la noche"
    @State var textName = "FELICITAS GARCÍA CASTRO"
    @State var showTable = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Nota: \(text)")
            }
            .foregroundColor(.black)
            
            HStack {
                Text("Solicita: \(textName)")
            }
            .foregroundColor(.black)
            
            Button(action: {
                showTable.toggle()
            }) {
                Image(systemName: "chevron.down")
            }
            .bold()
            .padding(.top, 1)
            .foregroundColor(.red)
            .cornerRadius(5)
        }
        .padding()
        .padding(.horizontal)
        .font(.body)
        .fontWeight(.light)
        .background(Color.white)
        .cornerRadius(20)
        
        if showTable {
            Group{
                Section{
                    Table() // Llama a la vista de la tabla
                }
                .shadow(color: .black.opacity(0.3), radius: 5)
                .padding(.top, 1)
            }
        }
    }
}

struct Table: View{
    
    let tableData: [(cantidad: String, descripcion: String)] = [
        (cantidad: "1.54 KG", descripcion: "LONGANIZA CHILACTECA"),
        (cantidad: "1.01 KG", descripcion: "QUESILLO CAMACHO"),
    ]
    
    var body: some View {
        VStack {
            //Encabezados de la columna
            HStack {
                Text("Cantidad")
                    .frame(maxWidth: .infinity, alignment: .center)
                Divider() //Linea divisora
                    .background(Color.black)
                Text("Descripción")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .bold()
            .font(.headline)
            
            // Filas de la tabla
            ForEach(tableData, id: \.descripcion) { data in
                Divider()
                    .background(Color.black)
                HStack {
                    Text("\(data.cantidad)")
                        .frame(maxWidth: .infinity, alignment: .center)
                    Text(data.descripcion)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
        }
        .padding()
        .font(.body)
        .fontWeight(.light)
        .foregroundColor(.black)
        .background(Color.white)
        .cornerRadius(20)
    }
}
