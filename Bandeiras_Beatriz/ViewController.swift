//
//  ViewController.swift
//  Bandeiras_Beatriz
//
//  Created by user219712 on 8/7/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    
    var paises = [String]()
    var pontuacao = 0
    var respostaCorreta = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Button1.layer.borderWidth = 1
        Button2.layer.borderWidth = 1
        Button3.layer.borderWidth = 1
        
        Button1.layer.borderColor = UIColor.lightGray.cgColor
        Button2.layer.borderColor = UIColor.lightGray.cgColor
        Button3.layer.borderColor = UIColor.lightGray.cgColor
        
        
        paises += ["estonia", "france", "germany", "irland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
        
        fazerPergunta()
    }
    
    func fazerPergunta (action: UIAlertAction! = nil){
        paises.shuffle()
        
        Button1.setImage(UIImage(named: paises[0]), for: .normal)
        Button2.setImage(UIImage(named: paises[1]), for: .normal)
        Button3.setImage(UIImage(named: paises[2]), for: .normal)
        
        respostaCorreta = Int.random(in: 0...2)
        
        title = paises[respostaCorreta].uppercased()
    }
  
    @IBAction func clicouBotao(_ sender: UIButton) {
      
        var titulo: String
        //Verificar se a resposta esta correta
        //Ajustar a pontuação
        if sender.tag == respostaCorreta {
            titulo = "Acertou"
            pontuacao += 1
        } else {
            titulo = "Errou"
            pontuacao -= 1
        }
        
        //Mostrar alerta"
        let alerta = UIAlertController(title: titulo, message: "Sua pontuação é \(pontuacao)", preferredStyle: .alert)
        alerta.addAction(UIAlertAction(title: "Continuar", style: .default, handler: fazerPergunta ))
        present(alerta, animated: true)
        
    
        
    }
    
}


