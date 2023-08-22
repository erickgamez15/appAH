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
    
    //Variable que contiene el valor por defecto de date
    @State var date: String = "yyyy-MM-dd"
    
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
                                .accentColor(.red)
                                
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
                                        
                                    }) {
                                        Image(systemName: "doc.text.magnifyingglass")
                                        Text("Ver")
                                    }
                                    .padding(34)
                                    .frame(height: 35)
                                    .foregroundColor(.white)
                                    .background(Color.red)
                                    .cornerRadius(5)
                                }
                                .bold()
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
                    Totales(fecha: date)
                    
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
