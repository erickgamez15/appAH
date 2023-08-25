//
//  Inicio.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 15/08/23.
//

import SwiftUI

struct Inicio: View {
    
    //Instancias
    @StateObject private var viewModel = ViewModel()
    @State var currentDate: Date = Date()
    @State var fecha: Fecha = Fecha()
    
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
                                    Text("Entradas: ")
                                    Text("$\(totalVentasFunc(), specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 10)
                                .foregroundColor(.green)
                                
                                Divider() //Linea divisora
                                
                                HStack {
                                    Text("Salidas: ")
                                    Text("$\(salidasTotalFunc(), specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 10)
                                .foregroundColor(.red)
                                
                                Divider()
                                
                                HStack {
                                    Text("Total final: ")
                                    Text("$\(totalVentasFunc() - salidasTotalFunc(), specifier: "%.3f")")
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
                    
                    Group{
                        Section(
                            header: Text("Entradas")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading)
                                .padding(.bottom, 5.0)
                                .padding(.top, 30)
                        ){
                            let totalArray = desgloceEntradasFunc()
                            VStack{
                                VStack{
                                    HStack{
                                        Text("Total Entradas: ")
                                        Text("$\(totalVentasFunc(), specifier: "%.3f")")
                                            .frame(maxWidth: .infinity, alignment: .trailing)
                                    }
                                    .bold()
                                    .foregroundColor(.green)
                                    
                                    Divider()
                                }
                                
                                HStack{
                                    Label("Efectivo: ", systemImage: "dollarsign")
                                    Text("$\(totalArray[0], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Tarjetas: ", systemImage: "creditcard")
                                    Text("$\(totalArray[1], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Créditos: ", systemImage: "percent")
                                    Text("$\(totalArray[2], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Monedas: ", systemImage: "dollarsign.circle")
                                    Text("$\(totalArray[3], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Transferencia: ", systemImage: "arrow.right.arrow.left")
                                    Text("$\(totalArray[4], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Cheques: ", systemImage: "doc.text")
                                    Text("$\(totalArray[5], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Otros: ", systemImage: "questionmark.circle")
                                    Text("$\(totalArray[6], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Delicias: ", systemImage: "bag.badge.plus")
                                    Text("$\(deliciasVentasFunc(), specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                                
                                HStack{
                                    Label("Pagos de notas de otras fechas: ", systemImage: "calendar")
                                    Text("$\(pagosOtrasFechasFunc(), specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.vertical, 5)
                            }//End VStack
                            .padding()
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }//End Section
                    }//End Group
                    
                    Group{
                        Section(
                            header: Text("Salidas")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding(.leading)
                                .padding(.bottom, 5.0)
                                .padding(.top, 30)
                        ){
                            let totalArray = desgloceSalidasFunc()
                            VStack{
                                HStack{
                                    Text("Total Salidas: ")
                                    Text("$\(salidasTotalFunc(), specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .bold()
                                .foregroundColor(.red)
                                
                                Divider() //Linea divisora
                                
                                HStack{
                                    Label("Gastos: ", systemImage: "dollarsign")
                                    Text("$\(totalArray[0], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.bottom, 10)
                                
                                HStack{
                                    Label("Devoluciones Cancelaciones: ", systemImage: "arrow.counterclockwise")
                                    Text("$\(totalArray[1], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.bottom, 10)
                                
                                HStack{
                                    Label("Sueldos: ", systemImage: "person.2")
                                    Text("$\(totalArray[2], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.bottom, 10)
                                
                                HStack{
                                    Label("Vales: ", systemImage: "tag")
                                    Text("$\(totalArray[3], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.bottom, 10)
                                
                                HStack{
                                    Label("Importe de Bonificación: ", systemImage: "doc.text")
                                    Text("$\(totalArray[4], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.bottom, 10)
                                
                                HStack{
                                    Label("Suministros: ", systemImage: "cart")
                                    Text("$\(totalArray[5], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.bottom, 10)
                                
                                HStack{
                                    Label("Préstamos: ", systemImage: "calendar")
                                    Text("$\(totalArray[6], specifier: "%.3f")")
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                                .padding(.bottom, 10)
                            }//End VStack
                            .padding()
                            .font(.body)
                            .fontWeight(.light)
                            .foregroundColor(.black)
                            .background(Color.white)
                            .cornerRadius(20)
                        }//End Section
                    }//End Group
                    
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
            /*.toolbar {
                //placement indica la posicion del elemento .navigationBarTrailing lo pone a la derecha y .navigationBarLeading lo pone a la izquierda
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {}) {
                        Image(systemName: "line.horizontal.3")
                    }
                    .accentColor(.black)
                }
            }*/
            .padding(.top, -40.0)
        }//End NavigationView
    }//End body
    
    //Trae el valor de la venta diaria de Delicias
    func deliciasVentasFunc() -> Double {
        var totalVentaDelicia: Double = 0.0
       
        for delicia in viewModel.delicias ?? [] {
            if let totalDelicia = Double(delicia.TOTALVENTA) {
                totalVentaDelicia += totalDelicia
            } else {
                print("No se pudo convertir '\(delicia.TOTALVENTA)' a Float.")
            }
        }
        
        return totalVentaDelicia
    }
    
    //Trae el valor de la venta diaria de Delicias
    func pagosOtrasFechasFunc() -> Double {
        var otrosPagos: Double = 0.0
       
        for otroPago in viewModel.pagosOtrasFechas ?? [] {
            if let totalPago = Double(otroPago.IMPORTECAJA) {
                otrosPagos += totalPago
            } else {
                print("No se pudo convertir '\(otroPago.IMPORTECAJA)' a Double.")
            }
        }
        
        return otrosPagos
    }
    
    //Trae el valor de venta total de AH
    func totalVentasFunc() -> Double{
        var totalVentas: Double = 0.0
        var total: Double = 0.0
        
        for importe in viewModel.totales ?? [] {
            if let importeTotal = Double(importe.IMPORTECAJA) {
                totalVentas += importeTotal
            } else {
                print("No se pudo convertir '\(importe.IMPORTECAJA)' a Float.")
            }
        }
        
        //Suma de la venta total de AH + Delicias + Pagos Otras Fechas
        total = totalVentas + deliciasVentasFunc() + pagosOtrasFechasFunc()
        
        return total
    }
    
    //Funcion que desgloca cada movimiento en las entradas
    func desgloceEntradasFunc() -> [Double]{
        var total: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        //Diccionario
        let typeMapping: [String: Int] = [
            "DEPOSITO EFECTIVO": 0,
            "IMPORTE EFECTIVO": 0,
            "IMPORTE TARJETAS": 1,
            "IMPORTE TARJETA": 1,
            "IMPORTE CREDITO": 2,
            "IMPORTE MONEDAS": 3,
            "IMPORTE TRANSFERENCIAS": 4,
            "IMPORTE TRASFERENCIAS": 4,
            "IMPORTE CHEQUES": 5,
            "IMPORTE OTROS": 6,
        ]
        
        for desgloce in viewModel.desgloce ?? [] {
            if let index = typeMapping[desgloce.tipooper] {
                total[index] += Double(desgloce.totalcajero) ?? 0
            }
        }
        
        return total
    }
    
    //Funcion que desgloca cada movimiento en las entradas
    func desgloceSalidasFunc() -> [Double]{
        var total: [Double] = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]
        
        //Diccionario
        let typeMapping: [String: Int] = [
            "IMPORTE GASTOS": 0,
            "IMPORTE DEVOLUCIONES O CANCELACIONES": 1,
            "IMPORTE SUELDOS": 2,
            "IMPORTE VALES": 3,
            "IMPORTE BONIFICACION": 4,
            "IMPORTE SUMINISTROS": 5,
            "IMPORTE PRESTAMOS": 6,
        ]
        
        for desgloce in viewModel.desgloce ?? [] {
            if let index = typeMapping[desgloce.tipooper] {
                total[index] += Double(desgloce.totalcajero) ?? 0
            }
        }
        
        return total
    }
    
    //Funcion que trae el total de Gastos
    func salidasTotalFunc() -> Double {
        var total: Double = 0.0
        
        for salida in desgloceSalidasFunc(){
            total += salida
        }
        
        return total
    }
}//End View

struct Inicio_Previews: PreviewProvider {
    static var previews: some View {
        Inicio()
    }
}
