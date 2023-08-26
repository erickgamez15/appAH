//
//  CardsTraspasos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import Foundation
import SwiftUI

struct CardsTraspasos: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var nota: String
    var solicita: String
    var docid: String
    
    @State private var tableData: [(cantidad: String, unidad: String, descripcion: String)] = []
    @State private var showTable = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Nota: ")
                Text("\(nota)")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .bold()
            .foregroundColor(.black)
            
            HStack {
                Text("Solicita: ")
                Text("\(solicita)")
                    .frame(maxWidth: .infinity, alignment: .leading)
                Button(action: {
                    viewModel.fetchImagenData(docid: docid)
                    viewModel.fetchTablaData(docid: docid)
                    tableData = viewModel.tabla?.map { tb in
                        return (cantidad: tb.DESCANTIDAD, unidad: tb.UNIDAD, descripcion: tb.DESCRIPCIO)
                    } ?? []
                    showTable.toggle()
                }) {
                    if showTable {
                        Image(systemName: "chevron.down")
                            .transition(.scale)
                    } else {
                        Image(systemName: "chevron.right")
                            .transition(.scale)
                    }
                }
                .bold()
                .padding(.top, 1)
                .foregroundColor(.red)
                .cornerRadius(5)
            }
            .bold()
            .foregroundColor(.cyan)
        }
        .padding()
        .padding(.horizontal)
        .font(.body)
        .fontWeight(.light)
        .background(Color.white)
        .cornerRadius(20)
        
        if showTable {
            if let tabla = viewModel.tabla {
                Tabla(tabla: tabla)
            }
        }
    }
}
