//
//  TraspasosData.swift
//  appAH
//
//  Created by Erick Gámez Sánchez on 18/08/23.
//

import Foundation
import SwiftUI

struct TraspasosData: Decodable{
    var DOCID: String
    var NUMERO: String
    var ESTADO: String
    var FECHA: String
    var NOTA: String
    var XSOLICITA: String
}
