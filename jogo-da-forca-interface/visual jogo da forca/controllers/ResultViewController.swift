//
//  ResultViewController.swift
//  visual jogo da forca
//
//  Created by IFPB on 11/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    var resultado: String?
    @IBOutlet weak var labelResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.labelResult.text = self.resultado
    }
    
    @IBAction func voltar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }

}
