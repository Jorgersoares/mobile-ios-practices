//
//  ViewController.swift
//  visual jogo da forca
//
//  Created by IFPB on 10/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var jogoForca: Game!
    @IBOutlet weak var labelDica: UILabel!
    @IBOutlet weak var labelQtdPalavra: UILabel!
    @IBOutlet weak var labelLetrasJogadas: UILabel!
    @IBOutlet weak var labelTentativas: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var textFieldLetra: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.jogoForca = Game()
        self.atualizaInfos()
    }

    @IBAction func play(_ sender: Any) {
        let letra = Character(self.textFieldLetra.text!)
        self.jogoForca.jogar(letra: letra)
        if (self.jogoForca.terminou()) {
            let rvc = self.storyboard?.instantiateViewController(identifier: "view_resultado") as! ResultViewController
            rvc.resultado = self.jogoForca.resultadoFinal()
            self.present(rvc, animated: true, completion: nil)
            
            self.jogoForca = Game()
            
        }
        self.atualizaInfos()
        self.textFieldLetra.text = ""
        
    }
    
    func atualizaInfos() {
        self.labelTentativas.text = "Tentativas: \(self.jogoForca.tentativas)"
        self.labelStatus.text = String(self.jogoForca.preview)
        self.labelLetrasJogadas.text = String(self.jogoForca.letrasJogadas)
        self.labelDica.text = self.jogoForca.dica
        self.labelQtdPalavra.text = "A palavra possui \(self.jogoForca.palavra.count) letras "
        self.setImageStatus()
    }
    
    func setImageStatus() {
        self.imageView.image = UIImage(named: String(self.jogoForca.tentativas))
    }
}

