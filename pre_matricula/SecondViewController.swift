//
//  SecondViewController.swift
//  pre_matricula
//
//  Created by Victor Nunes on 18/08/2018.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import UIKit

class SecondViewController: UITableViewController {

    var cpf: String = ""
    
    @IBOutlet var tabela: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let customTabBarController = self.tabBarController as? TabsController {
            self.cpf = customTabBarController.x
        }
        
        let pm = Prematricula(
            id: "",
            aluno: "",
            mae: "",
            pai: "",
            cpf_responsavel: "",
            telefone: "",
            serie: ""
        )
        pm.getData()
        pm.getDataByCpf(cpf: self.cpf)
        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabela.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        cell.textLabel?.text = "aaaa"//data[indexPath]
        print("oi negoo")
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

