//
//  DesgloceData.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 17/08/23.
//

import Foundation
import SwiftUI

//Model para los datos provenientes de la api en la opcion 51
struct Desgloce: Decodable{
    //var id: Int
    var idMo: String
    var fecha: String
    var tipooper: String
    var totalcajero: String
}
