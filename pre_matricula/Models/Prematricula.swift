//
//  Prematricula.swift
//  pre_matricula
//
//  Created by Victor Nunes on 06/11/18.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import Foundation
import FirebaseDatabase
//import Firebase
import FirebaseFirestore

class Prematricula {
    
    var id:String
    let aluno: String
    let mae: String
    let pai: String
    let cpf_responsavel: String
    let telefone: String
    let serie: String
    
    let ref = Database.database().reference().child("pm")
    let db = Firestore.firestore()
    
    func createDictionary() -> [String:Any] {//-> NSDictionary {
        
        let data = [
            "aluno": self.aluno,
            "mae"  : self.mae,
            "pai"  : self.pai,
            "cpf_responsavel" : self.cpf_responsavel,
            "telefone"  : self.telefone,
            "serie" : self.serie
        ]
        
        return data as [String:Any]//as NSDictionary
    }

    func insertData() {
        let dict = self.createDictionary()
        //self.ref.childByAutoId().setValue(dict)
        let reg = dict["aluno"] as! String
        let pmRef = db.collection("pm")
        pmRef.document(reg).setData(dict)
    }
    
    func getData(){
        
        let pmRef = db.collection("pm")
        
        pmRef.whereField("cpf_responsavel", isEqualTo: "05769044578")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        //print("\(document.documentID) => \(document.data())")
                        print(document.data()["aluno"] ?? "")
                        //print(document.data()["serie"] ?? "")
                    }
                }
        }
        /*
        self.db.observe(.value, with: { (snapshot) in
            for child in snapshot.children {
                
                let childSnapshot = child as! DataSnapshot
                let value = childSnapshot.value as? NSDictionary
                let pai = value?["pai"] as? String ?? ""
                print(pai)
            }
        }, changeHandler: <#(Firestore, NSKeyValueObservedChange<Value>) -> Void#>)
         */
    }
    
    func getDataByCpf(cpf: String){
        self.ref.queryOrdered(byChild: "cpf_responsavel").queryEqual(toValue: cpf).observe(.value, with: { (snapshot) in
            for child in snapshot.children {
                
                let childSnapshot = child as! DataSnapshot
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
