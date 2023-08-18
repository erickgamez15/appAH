//
//  GastosData.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 18/08/23.
//

import Foundation
import SwiftUI

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
