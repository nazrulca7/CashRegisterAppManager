//
//  ManagerViewController.swift
//  CashRegisterAppManager
//
//  Created by Md Nazrul Islam on 2021-10-25.
//

import UIKit

class ManagerViewController: UIViewController {

    var ProductVar: Product?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toRestockView"){
         
            let RestockView = segue.destination as! RestockViewController
            RestockView.ProductVar = ProductVar
        }
        
       
   
    
    }
    
}
