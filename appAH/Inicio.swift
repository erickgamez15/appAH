//
//  Inicio.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct Inicio: View {
    @State var currentDate: Date = Date()
    @State var valueVentas = "88888888.80"
    @State var value = "88888888.80"
    
    private var viewModel: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    Group {
                        Section(header: Text("Fecha").font(.title).fontWeight(.heavy).foregroundColor(.white).padding(.leading, -180)){
                            VStack{
                                DatePicker(
                                    "Seleccionar una fecha",
                                    selection: $currentDate,
                                    in: ...Date(),
                                    displayedComponents: .date
                                )
                                
                                //Contiene la fecha en formato yyyy-MM-dd
                                let formattedDate = formatDate(date: currentDate)
                                
                                HStack {
                                    Text(formattedDate)
                                        .bold()
                                    Spacer()
                                    Button("Ver") {
                                        viewModel.opcion51Api(date: formattedDate){ data, error in
                                            if let error = error {
                                                print("Error: \(error)")
                                            } else if let data = data {
                                                if let responseString = String(data: data, encoding: .utf8) {
                                                    print("Response: \(responseString)")
                                                }
                                            }
                                        }
                                    }
                                    .bold()
                                    .padding(50)
                                    .frame(height: 33)
                                    .foregroundColor(.white)
                                    .background(Color.red.opacity(0.95))
                                    .cornerRadius(5)
                                }
                            }
                            .padding()
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }
                    
                    Group {
                        Section(header: Text("Totales").font(.title).fontWeight(.heavy).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
                            VStack{
                                HStack {
                                    Text("Ventas:")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $valueVentas)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .foregroundColor(.green)
                                
                                HStack {
                                    Text("Gastos:")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $valueVentas)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .foregroundColor(.red)
                                
                                HStack {
                                    Text("Total final:")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $valueVentas)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                            .padding()
                            .padding(.horizontal)
                            .bold()
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }
                    
                    Group {
                        Section(header: Text("Ingresos").font(.title).fontWeight(.heavy).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
                            VStack(alignment: .leading){
                                HStack{
                                    Label("Efectivo: ", systemImage: "dollarsign")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Tarjetas: ", systemImage: "creditcard")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Créditos: ", systemImage: "percent")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Monedas: ", systemImage: "dollarsign.circle")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Transferencia: ", systemImage: "arrow.right.arrow.left")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Cheques: ", systemImage: "doc.text")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Text("Total Entradas: ")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .bold()
                                .foregroundColor(.green)
                            }
                            .padding()
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }
                    
                    Group {
                        Section(header: Text("Egresos").font(.title).fontWeight(.heavy).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
                            VStack(alignment: .leading){
                                HStack{
                                    Label("Gastos: ", systemImage: "dollarsign")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Devoluciones Cancelaciones: ", systemImage: "arrow.counterclockwise")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Sueldos: ", systemImage: "person.2")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Vales: ", systemImage: "tag")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Importe de Bonificación: ", systemImage: "doc.text")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Suministros: ", systemImage: "cart")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Text("Total Salidas: ")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .bold()
                                .foregroundColor(.red)
                            }
                            .padding()
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }
                    
                    /*Group {
                        Section(header: Text("Otros Pagos").font(.title).fontWeight(.heavy).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
                            VStack{
                                HStack{
                                    Text("Pagos de notas de otras fechas: ")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .bold()
                                .foregroundColor(.blue)
                                
                                HStack{
                                    Label("Otros", systemImage: "questionmark.circle")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                            .padding()
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                    }*/
                    
                    VStack{
                        
                    }
                    .padding(.bottom, 20)
                }
                .padding(.top, 30)
                .padding(.horizontal, 15)
            }
            .background(Color.red)
            .cornerRadius(25)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Abarrotera Hidalgo")
                        .font(.title2)
                        .bold()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                    }
                    .accentColor(.black)
                }
            }
            .padding(.top, -40.0)
        }
    }
    
    //Funcion para formatear la fecha
    private func formatDate(date: Date) -> String {
        let newDateFormatter = DateFormatter()
        newDateFormatter.dateFormat = "yyyy-MM-dd"
        return newDateFormatter.string(from: date)
    }
}

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
