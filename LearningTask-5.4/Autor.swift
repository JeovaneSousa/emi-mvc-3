//
//  Autor.swift
//  LearningTask-5.4
//
//  Created by jeovane.barbosa on 07/11/22.
//

import Foundation

struct Autor {
    private let nome: String
    private let sobrenome: String
    private let fotoUrl: String
    private let bio: String
    private let tecnologia: String
    
    var nomeCompleto: String {
        get{"\(self.nome) \(self.sobrenome)"}
    }
    
    public init(nome: String, sobrenome: String, fotoUrl: String, bio: String, tecnologia: String) {
        self.nome = nome
        self.sobrenome = sobrenome
        self.fotoUrl = fotoUrl
        self.bio = bio
        self.tecnologia = tecnologia
    }
}
