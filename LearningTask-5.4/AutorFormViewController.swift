//
//  ViewController.swift
//  LearningTask-5.4
//
//  Created by rafael.rollo on 09/03/2022.
//

import UIKit

class AutorFormViewController: UIViewController {

    @IBOutlet weak var fotoTextField: UITextField!
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var bioTextField: UITextField!
    @IBOutlet weak var tecnologiasTextField: UITextField!
    
    typealias ValidationMessage = String
    typealias Titulo = String
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func botaoSalvarPressionado(_ sender: UIButton) {
        switch checarForm() {
        case (false, let errorMessage, let titulo):
            exibirAlerta(para: errorMessage, eTitulo: titulo)
            
        case (true, let mensagemDeSucesso, let titulo):
            let (primeiroNome, sobrenome) = Formater.formata(nomeDeAutor: nomeTextField.text!)
            
            let autor = Autor(nome: primeiroNome,
                             sobrenome: sobrenome,
                             fotoUrl: fotoTextField.text!,
                             bio: bioTextField.text!,
                             tecnologia: tecnologiasTextField.text!)
            
            AutorRepository.salva(autor)
            
            exibirAlerta(para: mensagemDeSucesso, eTitulo: titulo)
            
            print("O nome completo é gerado via computed variable para o valor \(autor.nomeCompleto)")
        }

    }
    
    func checarForm() -> (Bool, ValidationMessage?, Titulo){
        if let foto = fotoTextField.text, foto.isEmpty{
            return(false, "Por favor, adicione uma URL.", "Erro")
        }
        guard let nome = nomeTextField.text, !nome.isEmpty else {return (false, "Por favor, preencha seu nome completo.", "Erro")}
        
        if !Validator.nomeDeAutorValido(nome){
            return (false, "Nome Invalido, por favor, reveja seus dados.", "Erro")
        }
        
        if let bio = bioTextField.text, bio.isEmpty{
            return (false, "Por favor, preencha com sua bio.", "Erro")
        }
        if let tecnologia = tecnologiasTextField.text, tecnologia.isEmpty {
            return (false, "Por favor, preencha com suas tecnologias", "Erro")
        }
        return (true, "Autor adicionado com sucesso!", "Feito!")
    }
    
    func exibirAlerta(para mensagem: ValidationMessage?, eTitulo titulo: String?){
        let titulo = titulo ?? "Error"
        let message = mensagem ?? "Por favor, reveja seus dados e tente novamente."
        let alert = UIAlertController(title: titulo, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}
