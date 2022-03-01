//
//  FormViewController.swift
//  filmes
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    
    @IBOutlet weak var inputNomeFilme: UITextField!
    @IBOutlet weak var sliderNotaFilme: UISlider!
    @IBOutlet weak var previewSliderNotaFilme: UILabel!
    @IBOutlet weak var switchOscarFilme: UISwitch!
    @IBOutlet weak var stepperQtdAssistiuFilmes: UIStepper!
    @IBOutlet weak var previewStepper: UILabel!
    var filmes: Filmes!
    
    @IBAction func notaChanged(_ sender: Any) {
        self.previewSliderNotaFilme.text = String(Int(self.sliderNotaFilme.value))
    }
    
    @IBAction func stepperChanged(_ sender: Any) {
        self.previewStepper.text = String(Int(self.stepperQtdAssistiuFilmes.value))
    }
    
    @IBAction func save(_ sender: Any) {
        let nomeFilme = self.inputNomeFilme.text!
        let notaFilme = Int(self.sliderNotaFilme.value)
        let possuiOscar = self.switchOscarFilme.isOn
        let quantidadeAssistidas = Int(self.stepperQtdAssistiuFilmes.value)
        let filme = Filme(nome: nomeFilme, nota: notaFilme, possuiOscar: possuiOscar, qtdAssistidas: quantidadeAssistidas)
        self.filmes = (UIApplication.shared.delegate as! AppDelegate).filmes
        self.filmes.addFilme(filme: filme)
        print(filme)
        self.navigationController?.popViewController(animated: true)
    }
}
