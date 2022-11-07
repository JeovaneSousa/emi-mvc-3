//
//  Validator.swift
//  LearningTask-5.4
//
//  Created by jeovane.barbosa on 07/11/22.
//

import Foundation

class Validator{
    static func nomeDeAutorValido(_ nome: String) -> Bool {
        let pattern = #"^[a-zA-Z-]+ ?.* [a-zA-Z-]+$"#
        return NSPredicate(format: "SELF MATCHES %@", pattern).evaluate(with: nome)
    }
}

