//
//  DesgloceData.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 17/08/23.
//

import Foundation
import SwiftUI

struct Desgloce: Decodable, Identifiable{
    var id: Int
    var idMo: String
    var fecha: String
    var tipooper: String
    var totalcajero: String
}
