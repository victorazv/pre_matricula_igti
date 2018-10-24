//
//  FirstViewController.swift
//  pre_matricula
//
//  Created by Victor Nunes on 18/08/2018.
//  Copyright © 2018 Victor Nunes. All rights reserved.
//

import UIKit
//import FirebaseDatabase

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
        
        let dados = Dados(aluno: "Victor", mae: "Telma", pai: "Adelmo")
        let url = URL(string: "https://pre-matricula-fd98c.firebaseio.com/pm/")!
        var request = URLRequest(url: url)
        
        guard let uploadData = try? JSONEncoder().encode(dados) else {
            return
        }
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.uploadTask(with: request, from: uploadData) { data, response, error in
            if let error = error {
                print ("error: \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse,
                (200...299).contains(response.statusCode) else {
                    print ("server error")
                    return
            }
            if let mimeType = response.mimeType,
                mimeType == "application/json",
                let data = data,
                let dataString = String(data: data, encoding: .utf8) {
                print ("got data: \(dataString)")
            }
        }
        task.resume()
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

