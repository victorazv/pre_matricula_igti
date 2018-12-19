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
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    
    @IBAction func btn_press(_ sender: UIButton) {

        let appDelegate = UIApplication.shared.delegate! as! AppDelegate
        let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "tabs")
        appDelegate.window?.rootViewController = initialViewController
        appDelegate.window?.makeKeyAndVisible()
        
        //let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        //let pm_nova =  storyboard.instantiateViewController(withIdentifier: "pm_nova")
        //self.present(pm_nova, animated:true, completion:nil)
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

