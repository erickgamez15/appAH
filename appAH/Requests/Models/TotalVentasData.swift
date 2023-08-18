//
//  TotalVentasData.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 18/08/23.
//

import Foundation
import SwiftUI

//Model para los datos provenientes de la api en la opcion 5
struct TotalVentasData: Decodable{
    var SERIEID: String
    var SERNOMBRE: String
    var FECHA: String
    var IMPORTECAJA: String
}
