//
//  Traspasos.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct Traspasos: View {
    
    //Instancias
    @State var currentDate: Date = Date()
    @State var fecha: Fecha = Fecha()
    @StateObject private var viewModel = ViewModel()
    
    //Variable que contiene el valor por defecto de date
    @State var date: String = "yyyy-MM-dd"
    @State private var showAlert = false
    @State private var alertMessage = ""
    
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
                                
                                //Contiene la fecha en formato yyyy-MM-dd
                                .onChange(of: currentDate) { newDate in
                                    date = fecha.formatDate(date: newDate)
                                }
                                
                                HStack {
                                    if(date != "yyyy-MM-dd"){
                                        Text(date)
                                    }else {
                                        Text("\(fecha.formatDate(date: currentDate))")
                                    }
                                    Spacer()
                                    Button(action: {
                                        if (date != "yyyy-MM-dd") {
                                            //Metodo que llama a cada opcion de la API
                                            viewModel.fetchData(date: date)
                                        } else {
                                            showAlert = true
                                            alertMessage = "Seleccione una fecha anterior a \(fecha.formatDate(date: currentDate))"
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
                                    .alert(isPresented: $showAlert) {
                                        Alert(title: Text("¡Advertencia!"), message: Text(alertMessage), dismissButton: .default(Text("Aceptar")))
                                    }
                                }
                                .bold()
                            }
                            .padding()
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                        .accentColor(.red)
                    }
                    
                    Group{
                        Section(
                            header: Text("Descripción")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading)
                                .padding(.bottom, 5.0)
                                .padding(.top, 20)
                        ){
                            ForEach(viewModel.traspasos ?? []) { traspaso in
                                CardsTraspasos(nota: "\(traspaso.NOTA)", solicita: "\(traspaso.XSOLICITA)")
                            }
                        }
                        .padding(.bottom)
                    }
                    
                    VStack{
                        
                    }.padding(.bottom, 20)
                }
                .padding(.top, 30)
                .padding(.horizontal, 15)
            }
            .background(Color.red)
            .cornerRadius(25)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Traspasos")
                        .font(.title2)
                        .bold()
                }
            }
            /*.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                    }
                    .accentColor(.black)
                }
            }*/
            .padding(.top, -40.0)
        }
    }
}

struct Traspasos_Previews: PreviewProvider {
    static var previews: some View {
        Traspasos()
    }
}
