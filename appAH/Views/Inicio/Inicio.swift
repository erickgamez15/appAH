//
//  Inicio.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct Inicio: View {
    
    //Instancias
    @State var currentDate: Date = Date()
    @State var fecha: Fecha = Fecha()
    //@State var modelView: ViewModel = ViewModel()
    
    //Variable que indica el valor por defecto que se muestra si no se ha seleccionado una fecha
    @State var formattedDate: String = "yyyy-MM-dd"
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Group{
                        Section(
                            //Estilos del header de Fecha
                            header: Text("Fecha")
                            //Indica el tamaño maximo del frame del elemento en relacion con el ancho del dispositivo y su alineación
                                .frame(maxWidth: .infinity, alignment: .leading)
                            //Estilo de la tipografía
                                .font(.title)
                            //Ancho de la tipografía
                                .fontWeight(.semibold)
                            //Color de la tipo grafía
                                .foregroundColor(.white)
                            //Padding indica los margenes del elemento
                            //.leading = izquierda
                            //.trailing = derecha
                            //.top = arriba
                            //.bottom = abajo
                                .padding(.leading)
                                .padding(.bottom, 5.0)
                        ){
                            VStack{
                                DatePicker(
                                    "Seleccionar una fecha",
                                    selection: $currentDate,
                                    //Puntos suspensivos a la izquierda indica que solamente se seleccionan fechas anteriores a $currentDate (fecha actual)
                                    in: ...Date(),
                                    displayedComponents: .date
                                )
                                
                                //Contiene la fecha en formato yyyy-MM-dd
                                .onChange(of: currentDate) { newValue in
                                    formattedDate = fecha.formatDate(date: newValue)
                                }
                                
                                HStack {
                                    Text(formattedDate)
                                        .bold()
                                    Spacer()
                                    Button(action: {
                                        ViewModel.opcion51Api(date: formattedDate){ response, error in
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
                            //Indica que dará un margen tanto a la derecha como a la izquierda
                            //.horizontal = derecha-izquierda
                            //.vertical = arriba-abajo
                            .padding(.horizontal)
                            .foregroundColor(.black)
                            .background(Color.white)
                            //Redondea los bordes del elemento
                            .cornerRadius(20)
                        }//End Section
                    }//End Group
                    
                    //Otros modulos dentro de la vista inicio, cada uno tiene su clase
                    Totales()
                    
                    Ingresos()
                    
                    Egresos()
                    
                    //VStack vacio que da un margen inferior
                    VStack{
                        
                    }
                    .padding(.bottom, 20)
                }//End VStack
                .padding(.top, 30)
                .padding(.horizontal, 15)
            }//End ScrollView
            .background(Color.red)
            .cornerRadius(25)
            //Se aplica a ScrollView y da el titulo a la vista
            .toolbar {
                //placement indica la posicion del elemento .principal lo pone en el centro
                ToolbarItem(placement: .principal) {
                    Text("Abarrotera Hidalgo")
                        .font(.title2)
                        .bold()
                }
            }
            //Se aplica a ScrollView y coloca el icono de bars a la derecha
            .toolbar {
                //placement indica la posicion del elemento .navigationBarTrailing lo pone a la derecha y .navigationBarLeading lo pone a la izquierda
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                    }
                    .accentColor(.black)
                }
            }
            .padding(.top, -40.0)
        }//End NavigationView
    }//End body
}//End View

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
