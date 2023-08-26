//
//  ModelData.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 19/08/23.
//

import Foundation

//Model para los datos provenientes de la api en la opcion 51
struct Desgloce: Decodable, Identifiable{
    var id: String { idMo }
    var idMo: String
    var fecha: String
    var tipooper: String
    var totalcajero: String
}

//Model para los datos provenientes de la api en la opcion 35
struct GastosData: Decodable, Identifiable{
    var id: String { idgasto }
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
struct TotalVentasData: Decodable, Identifiable{
    var id: String { SERIEID }
    var SERIEID: String
    var SERNOMBRE: String
    var FECHA: String
    var IMPORTECAJA: String
}

//Model para los datos provenientes de la api en la opcion 46
struct TraspasosData: Decodable, Identifiable{
    var id: String { DOCID }
    var DOCID: String
    var NUMERO: String
    var ESTADO: String
    var FECHA: String
    var NOTA: String
    var XSOLICITA: String
}

//Model para los datos provenientes de la api en la opcion 50
struct TablaData: Decodable, Identifiable{
    var id: String { CLAVE }
    var DESDOCID: String
    var DESCANTIDAD: String
    var UNIDAD: String
    var DESCRIPCIO: String
    var UBICACION: String
    var CLAVE: String
}

struct ImagenTabla: Decodable, Identifiable{
    var id: String { idCajasFotos }
    var idCajasFotos: String
    var imagen: String
    var URL: String
}

//Model para los datos provenientes de la api en la opcion 77
struct PagosOtrasFechas: Decodable, Identifiable{
    var id: String { SERIEID }
    var SERIEID: String
    var SERNOMBRE: String
    var FECHA: String
    var IMPORTECAJA: String
}

//Model para los datos provenientes de la api opcion 100
struct DeliciasData: Decodable, Identifiable{
    var id: String { IDSERIE }
    var IDSERIE: String
    var TOTALVENTA: String
}
