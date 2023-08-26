//
//  Tabla.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 26/08/23.
//

import SwiftUI

struct Tabla: View{
    
    var tabla: [TablaData]
    
    var body: some View {
        VStack {
            // Encabezados de la columna
            HStack {
                Text("Cantidad")
                    .frame(maxWidth: .infinity, alignment: .center)
                Divider()
                    .background(Color.black)
                Text("Descripción")
                    .frame(maxWidth: .infinity, alignment: .center)
            }
            .bold()
            .font(.headline)
            
            // Filas de la tabla
            ForEach(tabla, id: \.CLAVE) { tb in
                Divider()
                    .background(Color.black)
                HStack {
                    if let cantidadDouble = Double(tb.DESCANTIDAD) {
                        Text("\(cantidadDouble, specifier: "%.3f") \(tb.UNIDAD)")
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Divider()
                        .background(Color.black)
                    Text(tb.DESCRIPCIO)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        }
        .padding()
        .font(.body)
        .fontWeight(.light)
        .foregroundColor(.black)
        .background(Color.white)
        .overlay(Rectangle()
            .stroke(Color.black.opacity(0.5), lineWidth: 3))
    }
}
