class Game {
    let MAX_TENTATIVAS: Int = 10
    var preview: [String] = []
    var palavra: String
    var dica: String

    init(palavra: String, dica: String) {
        for i in 0...palavra.count-1 {
            self.preview.append("_")
        }
        self.palavra = palavra
        self.dica = dica
    }
    

    func run() {
        var erros: Int = 0
        var ganhou: Bool = false
        
        print("Jogo da forca!")
        print("Dica: \(dica)")
        print("Tente advinhar a palavra!!!")
        
        while erros < MAX_TENTATIVAS {
            
            print("\nInsira uma letra: ", terminator:"")
            var letra = readLine()
            letra = letra!.uppercased()

            if(!entradaIsValida(entrada: letra!)) {
                print("Entrada inválida!")
                continue
            }
            
            if(isLetraRepetida(letra: letra!)) {
                print("Letra repetida, tente outra!")
                continue
            }
            
            if(!(verificarAcerto(letra: letra!))) {
                erros = erros + 1
                print("Você possui \(MAX_TENTATIVAS-erros) tentativa(s)")
            }
            
            if(venceu()){
                ganhou = true
                break
            }
            
            print("Palavra: \(preview.joined())")
        }
        
        if(ganhou){
            print("Parabéns! Você venceu! A palavra é \(palavra)")
        } else {
            print("Que pena! Acabaram suas tentativas!")
        }

    }

    func verificarAcerto(letra: String) -> Bool {
        var acertou = false
        for i in 0...palavra.count-1 {
            if(Character(letra) == palavra[palavra.index(palavra.startIndex, offsetBy: i)]) {
                acertou = true
                preview[i] = letra
            }
        }
        return acertou
    }

    func isLetraRepetida(letra: String) -> Bool {
        return preview.contains(letra)
    }

    func venceu() -> Bool {
        return preview.contains("_") == false
    }

    func entradaIsValida(entrada: String) -> Bool {
        return entrada.count == 1 && entrada != ""
    }
}

var jogo = Game(palavra: "BASQUETE", dica: "esporte")
jogo.run()

