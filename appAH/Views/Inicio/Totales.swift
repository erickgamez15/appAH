//
//  Totales.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

struct Totales: View {
    
    @State var valueVentas = "88888888.80"
    
    var body: some View {
        Group{
            Section(header: Text("Totales").font(.title).fontWeight(.semibold).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
                VStack{
                    HStack {
                        Text("Ventas: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 5)
                    .foregroundColor(.green)
                    
                    HStack {
                        Text("Gastos: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 5)
                    .foregroundColor(.red)
                    
                    HStack {
                        Text("Total final: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.bottom, 5)
                    .foregroundColor(.black)
                }
                .bold()
                .font(.body)
                .padding()
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
            }
        }
    }
}
