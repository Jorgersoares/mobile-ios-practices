//
//  Filme.swift
//  filmes
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation

class Filme: NSObject {
    var nome: String;
    var nota: Int;
    var possuiOscar: Bool;
    var qtdAssistidas: Int;
    
    override var description: String {
        return "\(self.nome) - \(self.nota) - \(self.possuiOscar) - \(self.qtdAssistidas)"
    }
    
    init(nome: String, nota: Int, possuiOscar: Bool, qtdAssistidas: Int) {
        self.nome = nome
        self.nota = nota
        self.possuiOscar = possuiOscar
        self.qtdAssistidas = qtdAssistidas
    }
}
