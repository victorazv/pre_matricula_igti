//
//  FirstViewController.swift
//  pre_matricula
//
//  Created by Victor Nunes on 18/08/2018.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import UIKit
import FirebaseDatabase

class FirstViewController: UIViewController {

    @IBOutlet weak var btn_processar: UIButton!
    @IBOutlet weak var aluno: UITextField!
    @IBOutlet weak var mae: UITextField!
    @IBOutlet weak var pai: UITextField!
    @IBOutlet weak var cpf_responsabel: UITextField!
    @IBOutlet weak var telefone: UITextField!
    @IBOutlet weak var serie: UITextField!
    
    struct Dados: Codable {
        let aluno: String
        let mae: String
        let pai: String
        let cpf_responsavel: String
        let telefone: String
        let serie: String
    }
    /*
    func getData(){
        FIRDatabase.database().reference().child("pm").observe(.childAdded) { (snapshot: FIRDataSnapshot) in
            print(snapshot.value)
        }
    }
    */
    @IBAction func btn_processar_click(_ sender: UIButton) {

        let ref = FIRDatabase.database().reference().child("pm")
    
        // Insert
        let data = [
            "aluno": aluno.text,
            "mae"  : mae.text,
            "pai"  : pai.text,
            "cpf_responsavel" : cpf_responsabel.text,
            "telefone"  : telefone.text,
            "serie" : serie.text
        ]
        ref.childByAutoId().setValue(data)
        
        // Select
        ref.observe(.value, with: { (snapshot) in
            for child in snapshot.children {

                let childSnapshot = child as! FIRDataSnapshot
                let value = childSnapshot.value as? NSDictionary
                
                let pai = value?["pai"] as? String ?? ""
                print(pai)
            }
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //getData();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

