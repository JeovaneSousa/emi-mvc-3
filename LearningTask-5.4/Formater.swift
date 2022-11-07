//
//  Formater.swift
//  LearningTask-5.4
//
//  Created by jeovane.barbosa on 07/11/22.
//

import Foundation

class Formater {
    static func formata(nomeDeAutor: String) -> (String, String) {
        let separador = " "
        let nomeCompleto = nomeDeAutor.components(separatedBy: separador)
        return (nomeCompleto.first!, nomeCompleto.dropFirst().joined(separator: separador))
    }
}
