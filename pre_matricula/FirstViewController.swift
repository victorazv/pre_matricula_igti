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

    @IBOutlet weak var aluno: UITextField!
    @IBOutlet weak var pai: UITextField!
    @IBOutlet weak var mae: UITextField!
    @IBOutlet weak var btn_processar: UIButton!
    
    struct Dados: Codable {
        let aluno: String
        let mae: String
        let pai: String
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
    
        ref.observe(.value, with: { (snapshot) in
            //print(snapshot)
            for child in snapshot.children {
                //print(child.value)
            }
        })
        
        /*
        for child in snapshot.children {
            let snap = child as! FIRDataSnapshot
            let key = snap.key
            let value = snap.value
            print("oiiiiiiiiiii")
            print("key = \(key)  value = \(value!)")
        }
        */
        /*
        //Insert
         let data = [
            "aluno": "vic",
            "mae"  : "telma",
            "pai"  : "Adelmo"
         ]
        ref.childByAutoId().setValue(data)
        */
        

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

