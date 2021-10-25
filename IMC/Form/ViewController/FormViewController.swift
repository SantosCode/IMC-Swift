//
//  FormViewController.swift
//  IMC
//
//  Created by Luis Santos on 24/10/21.
//

import UIKit

class FormViewController: UIViewController {
    
    // MARK: - Properties
    var imc: IMC?
    
    // MARK: - Outlet
    @IBOutlet weak var textFieldNomeCompleto: UITextField!
    @IBOutlet weak var textFieldAltura: UITextField!
    @IBOutlet weak var textFieldPeso: UITextField!
    @IBOutlet weak var textFieldIdade: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "segueTelaResultados"){
            let telaResultados = segue.destination as? ResultViewController
            
            telaResultados?.imc = self.imc
        }
    }
    
    
    //MARK: - Actions
    @IBAction func calcularIMC(_ sender: Any) {
        
        guard let sNomeCompleto = textFieldNomeCompleto.text, self.textFieldNomeCompleto.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        
        guard let sAltura = textFieldAltura.text, self.textFieldAltura.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        
        guard let sPeso = textFieldPeso.text, self.textFieldPeso.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        
        guard let sIdade = textFieldIdade.text, self.textFieldIdade.text?.isEmpty == false else {
            exibirAlerta()
            return
        }
        
        //Convertando os valores em campos para realizar o calculo
        let alturaFloat = (sAltura as NSString).floatValue
        let pesoFloat = (sPeso as NSString).floatValue
        let idadeFloat = (sIdade as NSString).intValue
        
        self.imc = IMC(valorImc: (pesoFloat / (alturaFloat * alturaFloat)), nomeCompleto: sNomeCompleto, idade: idadeFloat)
        
        self.performSegue(withIdentifier: "segueTelaResultados", sender: nil)
        
    }
    
    @IBAction func limparCampos(_ sender: Any) {
        textFieldNomeCompleto.text = nil
        textFieldAltura.text = nil
        textFieldPeso.text = nil
        textFieldIdade.text = nil
    }
    
    //MARK: - Functions
    func exibirAlerta() {
        let alerta = UIAlertController(title: "Alerta", message: "Preencha todos os campos", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alerta, animated: true, completion: nil)
    }
}
