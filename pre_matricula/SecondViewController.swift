//
//  SecondViewController.swift
//  pre_matricula
//
//  Created by Victor Nunes on 18/08/2018.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import UIKit
import FirebaseFirestore

class SecondViewController: UITableViewController {

    var cpf: String = ""
    let pm = Prematricula(
        id: "",
        aluno: "",
        mae: "",
        pai: "",
        cpf_responsavel: "",
        telefone: "",
        serie: ""
    )
    var dados : [QueryDocumentSnapshot] = []
    var i: Int = 0
    let db = Firestore.firestore()
    
    @IBOutlet var tabela: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let customTabBarController = self.tabBarController as? TabsController {
            self.cpf = customTabBarController.x
        }
        tableView.dataSource = self
        tableView.delegate   = self
        //dados = pm.getDataByCpf(cpf: self.cpf)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
       
        db.collection("pm").whereField("cpf_responsavel", isEqualTo: "05769044578").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    self.dados.append(document)
                    //print("\(document.documentID) => \(document.data())")
                }
                cell.textLabel?.text = self.dados[indexPath.row].get("aluno") as! String
            }
        }
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

