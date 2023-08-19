//
//  ModelData.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 19/08/23.
//

import Foundation

//Model para los datos provenientes de la api en la opcion 51
struct Desgloce: Decodable{
    var idMo: String
    var fecha: String
    var tipooper: String
    var totalcajero: String
}

//Model para los datos provenientes de la api en la opcion 35
struct GastosData: Decodable{
    var idgasto: String
    var foliovale: String
    var fechacanje: String
    var hora: String
    var autor: String
    var solicita: String
    var importefinal: String
    var concept: String
    var tipo: String
    var emisor: String
    var obs: String
}

//Model para los datos provenientes de la api en la opcion 5
struct TotalVentasData: Decodable{
    var SERIEID: String
    var SERNOMBRE: String
    var FECHA: String
    var IMPORTECAJA: String
}

//Model para los datos provenientes de la api en la opcion 46
struct TraspasosData: Decodable{
    var DOCID: String
    var NUMERO: String
    var ESTADO: String
    var FECHA: String
    var NOTA: String
    var XSOLICITA: String
}

//Model para los datos provenientes de la api opcion 100
struct DeliciasData: Decodable{
    var IDSERIE: String
    var TOTALVENTA: String
}
