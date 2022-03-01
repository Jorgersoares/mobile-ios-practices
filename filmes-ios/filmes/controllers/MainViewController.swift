//
//  MainViewController.swift
//  filmes
//
//  Created by IFPB on 14/05/21.
//  Copyright © 2021 IFPB. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var labelQtdFilmes: UILabel!
    var filmes: Filmes!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.filmes = (UIApplication.shared.delegate as! AppDelegate).filmes
        self.labelQtdFilmes.text = String(self.filmes.getQuantidadeFilmes())    }
}
