//
//  Filmes.swift
//  filmes
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation

class Filmes {
    
    var filmes: [Filme]
    
    init() {
        self.filmes = Array<Filme>()
    }
    
    func addFilme(filme: Filme) {
        self.filmes.append(filme)
    }
    
    func getQuantidadeFilmes() -> Int {
        return self.filmes.count
    }
}
