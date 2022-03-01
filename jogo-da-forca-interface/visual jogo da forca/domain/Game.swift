//
//  Forca.swift
//  visual jogo da forca
//
//  Created by IFPB on 10/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import Foundation

class Game {
    let MAX_TENTATIVAS: Int = 10
    var tentativas: Int = 0
    var preview: [Character] = []
    var palavra: String
    var letrasJogadas: Array<Character>
    var dica: String
    var wordsList = [
        ["word": "bola", "dica": "Esporte"],
        ["word": "android", "dica": "Tecnologia"]
    ]

    init() {
        let randomInt = Int.random(in: 0..<2)
        let wordSelected = wordsList[randomInt]
        self.palavra = wordSelected["word"]!
        self.dica = wordSelected["dica"]!
        self.letrasJogadas = Array()
        for _ in 0...palavra.count-1 {
            self.preview.append("_")
        }
    }
    
    func contabilizaAcerto(letra: Character) -> Bool {
        var acertou = false
        for i in 0...palavra.count-1 {
            if(letra == palavra[palavra.index(palavra.startIndex, offsetBy: i)]) {
                acertou = true
                preview[i] = letra
            }
        }
        return acertou
    }

    func isLetraRepetida(letra: Character) -> Bool {
        return self.letrasJogadas.contains(letra)
    }

    func entradaIsValida(entrada: Character) -> Bool {
        entrada.isWhitespace
    }
    
    func jogar(letra: Character) {
        if(!self.entradaIsValida(entrada: letra) || !self.isLetraRepetida(letra: letra)){
            self.letrasJogadas.append(letra)
            if(!self.contabilizaAcerto(letra: letra)){
                self.tentativas += 1
            }
        }
    }
    
    func isVencedor() -> Bool {
        return self.preview.contains("_") == false
    }
    
    func isPerdedor() -> Bool {
        return self.tentativas == self.MAX_TENTATIVAS
    }
    
    func terminou() -> Bool {
        return self.isVencedor() || self.isPerdedor()
    }
    
    func resultadoFinal() -> String {
        if(self.terminou()){
            if(isVencedor()){
                return "Ganhou"
            } else {
                return "Perdeu"
            }
        } else {
            return "Em andamento"
        }
    }
}
