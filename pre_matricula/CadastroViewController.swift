//
//  FirstViewController.swift
//  pre_matricula
//
//  Created by Victor Nunes on 18/08/2018.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class CadastroViewController: UIViewController {

    @IBOutlet weak var btn_processar: UIButton!
    @IBOutlet weak var aluno: UITextField!
    @IBOutlet weak var mae: UITextField!
    @IBOutlet weak var pai: UITextField!
    @IBOutlet weak var cpf_responsavel: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var serie: UITextField!
    
    
    @IBAction func btn_processar_click(_ sender: UIButton) {
    
        let pm = Prematricula(
            id: "",
            aluno: aluno.text ?? "",
            mae: mae.text ?? "",
            pai: pai.text ?? "",
            cpf_responsavel: cpf_responsavel.text ?? "",
            telefone: telefone.text ?? "",
            serie: serie.text ?? ""
        )
        
        pm.insertData()

        // Select
        // pm.getData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // getData();
        if let customTabBarController = self.tabBarController as? TabsController {
            print(customTabBarController.x)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

/*
 func getData(){
 FIRDatabase.database().reference().child("pm").observe(.childAdded) { (snapshot: FIRDataSnapshot) in
 print(snapshot.value)
 }
 }
 */
