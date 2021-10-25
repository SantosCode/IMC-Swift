//
//  ResultViewController.swift
//  IMC
//
//  Created by Luis Santos on 24/10/21.
//

import UIKit

class ResultViewController: UIViewController {
    
    //MARK: - Properties
    var imc: IMC?
    
    //MARK: - Outlet
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelValorIdade: UILabel!
    @IBOutlet weak var labelResultado: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let imc = imc {
            let sValor = String(format: "%.2f", imc.valorImc)
            let sIdade = String(imc.idade)
            
            self.labelNome.text = "Olá \(imc.nomeCompleto)"
            self.labelValorIdade.text = "\(sIdade) anos"
            self.labelResultado.text = "\(sValor)"
        }
        
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
