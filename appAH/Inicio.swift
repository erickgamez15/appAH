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
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 10) {
                    Group {
                        Section(header: Text("Fechas").font(.title).fontWeight(.heavy).foregroundColor(.white).padding(.leading, -180)){
                            VStack{
                                DatePicker(
                                    "Seleccionar una fecha",
                                    selection: $currentDate,
                                    in: ...Date(),
                                    displayedComponents: .date
                                )
                                
                                HStack {
                                    Text(formatDate(date: currentDate))
                                        .bold()
                                    Spacer()
                                    Button("Ver") {
                                        
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
                                    Text("Total ventas del día:")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $valueVentas)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .foregroundColor(.green)
                                
                                HStack {
                                    Text("Gastos y Créditos:")
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
                        Section(header: Text("Ventas del día").font(.title).fontWeight(.heavy).foregroundColor(.white).padding(.top, 30).padding(.leading, -180)){
                            VStack {
                                HStack{
                                    Label("Efectivo", systemImage: "dollarsign")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Tarjeta", systemImage: "creditcard")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Créditos:", systemImage: "percent")
                                        .frame(width: 200, alignment: .leading)
                                    TextField("0", text: $value)
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                
                                HStack{
                                    Label("Monedas:", systemImage: "dollarsign.circle")
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
                    
                    Group {
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
                    }
                    
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
    
    //Funcion para mandar peticiones a la API
    /*private func getData(fecha: Date, opcion: String){
        guard let url = URL(string: "http://hidalgo.no-ip.info:5610/hidalgoapi/production/Panel.php") else {
            return
        }
        
        // Datos a enviar en el formulario
        let formattedDate = formatDate(date: fecha)
        
        var components = URLComponents()
            components.queryItems = [
                URLQueryItem(name: "fecha", value: formattedDate),
                URLQueryItem(name: "numero", value: opcion)
            ]
        
        // Crear la solicitud HTTP POST
           var request = URLRequest(url: url)
           request.httpMethod = "POST"
           request.httpBody = components.query?.data(using: .utf8)
           request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        // Realizar la solicitud
            let session = URLSession.shared
            let task = session.dataTask(with: request) { data, response, error in
                if let error = error {
                    return
                }

                guard let data = data else {
                    return
                }

                // Parsear la respuesta JSON
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        
                    }
                } catch {
                    
                }
            }

            task.resume()
    }*/
}

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
