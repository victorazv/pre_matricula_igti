//
//  LoginViewController.swift
//  pre_matricula
//
//  Created by Victor Nunes on 18/08/2018.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var btn_iniciar: UIButton!
    
    @IBOutlet weak var cpf: UITextField!
    @IBAction func btn_press(_ sender: UIButton) {
        
        if cpf.text?.isEmpty ?? true {
            self.showMessage()
        }
        else{
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let homeController = mainStoryboard.instantiateViewController(withIdentifier: "tabs") as! TabsController
            //let vc = homeController.viewControllers![1] as! CadastroViewController
            //vc.cpf_resp = "asdasdasd"
            homeController.x = cpf.text ?? "";
            appDelegate?.window?.rootViewController = homeController
        }
    }
    
    @IBAction func showMessage() {
        let alertController = UIAlertController(title: "Atenção", message:
            "CPF obrigatório", preferredStyle: UIAlertController.Style.alert)
        alertController.addAction(UIAlertAction(title: "Fechar", style: UIAlertAction.Style.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

