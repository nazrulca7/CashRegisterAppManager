//
//  RestockViewController.swift
//  CashRegisterAppManager
//
//  Created by Md Nazrul Islam on 2021-10-25.
//

import UIKit

class RestockViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    var ProductVar : Product?
    var HistoryModel : ProductHistoryModel = ProductHistoryModel()
    var selectedRowId : Int = -1
    var addForInventory : Int = 0
    @IBOutlet weak var txtStockProduct: UITextField!
    @IBOutlet weak var reStockTblView: UITableView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
           self.reStockTblView.delegate = self
            self.reStockTblView.dataSource = self
        navigationItem.title = "Restock"
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (ProductVar!.getAllProducts().count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allProduct = ProductVar!.getAllProducts()
        let cell = tableView.dequeueReusableCell(withIdentifier: "restockcell")!
        print(ProductVar)
        cell.textLabel?.text = String(allProduct[indexPath.row].productName) + "\n \(String(allProduct[indexPath.row].prodcutPrice))"
        cell.detailTextLabel?.text = String(allProduct[indexPath.row].productQty)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         
       
        selectedRowId = indexPath.row
        let selectedproductName = ProductVar!.getAllProducts()[indexPath.row].productName
        let selectQty = ProductVar!.getAllProducts()[indexPath.row].productQty
       
       
       
         if (selectedproductName != ""){
             
             txtStockProduct.text = "\(selectQty)"
          
          
         }
          
          
      }

    @IBAction func btnRestock(_ sender: Any) {
        addForInventory = Int(txtStockProduct.text!) ?? 0
               
               if(selectedRowId < 0 )
               {
                   print(selectedRowId)
                   let alert = UIAlertController(title: "Error", message: "You Have To Select An Item And Provide a New Quantity", preferredStyle: UIAlertController.Style.alert)
                   alert.addAction(UIAlertAction(title: "Okay?", style: UIAlertAction.Style.default, handler: nil))
                   self.present(alert, animated: true, completion: nil)
                  
                   
               }
                   
               
               
         
               //Sales confirmation
               let alert = UIAlertController(title: "Do you want to Restock product ?", message: "Are you sure?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "add", style: .default){ action
                    in
                   if let RestockQty = self.txtStockProduct.text {
                       
                       let findProduct =   self.ProductVar?.getAllProducts()
                       let productQty = findProduct?[self.selectedRowId].productQty
                       var productName = findProduct?[self.selectedRowId].productName
                       var prodctPrice =  findProduct?[self.selectedRowId].prodcutPrice
                 
                       var qty = findProduct?[self.selectedRowId].productQty
                       
                       let  producthistory = ProductHistory(pName: productName ?? "", pQty:productQty ?? 0, pPrice:Int(prodctPrice ?? 0))
                       
                      
                       self.HistoryModel.addNewHistoryProduct(newproduct: producthistory)
                       
                       findProduct?[self.selectedRowId].productQty =  (productQty ?? 0) + self.addForInventory
                       
                     
                   }
                   self.reStockTblView.reloadData()
                   self.selectedRowId = -1
                   
               }
               let action2 = UIAlertAction(title: "No", style: .cancel, handler: nil)
               
               alert.addAction(action1)
               alert.addAction(action2)

                present(alert,animated: true, completion:  nil )
               
           
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
