//
//  Prematricula.swift
//  pre_matricula
//
//  Created by Victor Nunes on 06/11/18.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import Foundation
import FirebaseDatabase

class Prematricula {
    
    var id:String
    let aluno: String
    let mae: String
    let pai: String
    let cpf_responsavel: String
    let telefone: String
    let serie: String
    
    let ref = FIRDatabase.database().reference().child("pm")
    
    func createDictionary() -> NSDictionary {
        
        let data = [
            "aluno": self.aluno,
            "mae"  : self.mae,
            "pai"  : self.pai,
            "cpf_responsavel" : self.cpf_responsavel,
            "telefone"  : self.telefone,
            "serie" : self.serie
        ]
        
        return data as NSDictionary
    }

    func insertData() {
        let dict = self.createDictionary()
        self.ref.childByAutoId().setValue(dict)
    }
    
    func getData(){
        self.ref.observe(.value, with: { (snapshot) in
            for child in snapshot.children {
                
                let childSnapshot = child as! FIRDataSnapshot
                let value = childSnapshot.value as? NSDictionary
                let pai = value?["pai"] as? String ?? ""
                print(pai)
            }
        })
    }
    
    init(id:String, aluno:String, mae:String, pai:String, cpf_responsavel:String, telefone:String, serie:String) {
        self.id = id
        self.aluno = aluno
        self.mae = mae
        self.pai = pai
        self.cpf_responsavel = cpf_responsavel
        self.telefone = telefone
        self.serie = serie
    }
    
}
