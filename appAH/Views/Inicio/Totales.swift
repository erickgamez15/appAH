//
//  Totales.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 16/08/23.
//

import SwiftUI

//Vista que muestra los totales
struct Totales: View {
    
    @State var valueVentas = "88888888.80"
    
    var body: some View {
        Group{
            Section(
                header: Text("Totales")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.leading)
                    .padding(.bottom, 5.0)
                    .padding(.top, 20)
            ){
                //VStack acomoda los elementos de manera vertical en una vista, miestras que HStack de manera horizontal
                VStack{
                    HStack {
                        Text("Ventas: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.green)
                    
                    Divider() //Linea divisora
                    
                    HStack {
                        Text("Gastos: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.red)
                    
                    Divider()
                    
                    HStack {
                        Text("Total final: ")
                        Text(valueVentas)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding(.vertical, 10)
                    .foregroundColor(.cyan)
                }
                .bold()
                .font(.body)
                .padding()
                .padding(.horizontal)
                .background(Color.white)
                .cornerRadius(20)
            }//End Section
        }//End Group
    }//End body
}//End View
