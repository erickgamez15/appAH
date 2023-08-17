//
//  Inicio.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct Inicio: View {
    
    @State var currentDate: Date = Date()
    @State var fecha: Fecha = Fecha()
    @State var modelView: ViewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Group{
                        Section(
                            header: Text("Fecha")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading)
                                .padding(.bottom, 5.0)
                        ){
                            VStack{
                                DatePicker(
                                    "Seleccionar una fecha",
                                    selection: $currentDate,
                                    in: ...Date(),
                                    displayedComponents: .date
                                )
                                
                                //Contiene la fecha en formatio yyyy-MM-dd
                                let formattedDate = fecha.formatDate(date: currentDate)
                                
                                HStack {
                                    Text(formattedDate)
                                        .bold()
                                    Spacer()
                                    Button(action: {
                                        modelView.opcion51Api(date: formattedDate){ response, error in
                                            if let error = error {
                                                print("Error: \(error)")
                                            } else if let response = response {
                                                if let responseString = String(data: response, encoding: .utf8) {
                                                    print("Response: \(responseString)")
                                                }
                                            }
                                        }
                                    }) {
                                        Image(systemName: "doc.text.magnifyingglass")
                                        Text("Ver")
                                    }
                                    .bold()
                                    .padding(34)
                                    .frame(height: 35)
                                    .foregroundColor(.white)
                                    .background(Color.red)
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
                    
                    Totales()
                    
                    Ingresos()
                    
                    Egresos()
                    
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
}

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
