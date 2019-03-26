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
    let pm = Prematricula(
        id: "",
        aluno: "",
        mae: "",
        pai: "",
        cpf_responsavel: "",
        telefone: "",
        serie: ""
    )
    var dados: [[String]] = []//NSDictionary = [:]
    
    @IBOutlet var tabela: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let customTabBarController = self.tabBarController as? TabsController {
            self.cpf = customTabBarController.x
        }
        
        //pm.getData()
        dados = pm.getDataByCpf(cpf: self.cpf)
        print("asdasdasdasdasdadasdass")
        print(dados)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        //return 10
        return dados.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabela.dequeueReusableCell(withIdentifier: "celula", for: indexPath)
        //for registro in dados {
            //let pai = registro["pai"] as? String ?? ""
            //print(pai)
        //}
        cell.textLabel?.text = ""//dados[indexPath]!["pai"] //data[indexPath]
        print("oi negoo")
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

