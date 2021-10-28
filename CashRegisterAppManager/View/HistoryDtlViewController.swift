//
//  HistoryDtlViewController.swift
//  CashRegisterAppManager
//
//  Created by Md Nazrul Islam on 2021-10-28.
//

import UIKit

class HistoryDtlViewController: UIViewController {

    var SelectRowId: Int = -1
    var HistoryModel : ProductHistoryModel?
    
    @IBOutlet weak var lblDisplaydtl: UILabel!
    @IBOutlet weak var lblproductQty: UILabel!
    @IBOutlet weak var lblproductPrice: UILabel!
    @IBOutlet weak var lblproductDate: UILabel!
    @IBOutlet weak var Totallbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
 
       
        if(SelectRowId != -1){
        let ProductName = self.HistoryModel?.getAllhistoryProducts()[SelectRowId].productName
            let productQty = self.HistoryModel?.getAllhistoryProducts()[SelectRowId].productQty
           let prodcutPrice = self.HistoryModel?.getAllhistoryProducts()[SelectRowId].prodcutPrice
            let productsaleTime = self.HistoryModel?.getAllhistoryProducts()[SelectRowId].productsaleTime
        
            let  Total_cost = (Float(productQty!)) * (prodcutPrice!)
            lblDisplaydtl.text? = "Product Name: \(ProductName!)"
            lblproductQty.text? = "Product Qty :\(productQty!)"
            lblproductPrice.text? = "Product price :\(prodcutPrice!)"
            Totallbl.text? = "Total Cost : \(Total_cost)"
            lblproductDate.text? = "Date :\(productsaleTime!)"
        }else{
            
            lblDisplaydtl.text = "No Product"
            
        }
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
    
    

}
