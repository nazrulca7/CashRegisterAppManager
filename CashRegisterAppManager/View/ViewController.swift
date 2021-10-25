//
//  ViewController.swift
//  CashRegisterApp
//
//  Created by Md Nazrul Islam on 2021-10-12.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource
{
    
    @IBOutlet weak var qtyShowtxt: UITextField!
   
    @IBOutlet weak var txtInputProductName: UITextField!
    @IBOutlet weak var VIEWProductTbl: UITableView!
   
    @IBOutlet weak var lblTotalAmountShow: UILabel!
   // @IBOutlet weak var lblTotalShow: UITextField!
    var loadtimes : Int = 0
    var loadQty : Int = 0
    var addForBuy : Int = 0
    var Products : Product  = Product()
    
    //var productStock : ProductStock = [ProductStock]()
    var vProductHistory  =  [ProductHistory]()
    
    @IBOutlet weak var txtTotalDisplay: UITextField!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (Products.getAllProducts().count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        print(indexPath.row)
        cell.textLabel?.text = Products.getAllProducts()[indexPath.row].productName
        
       /*String(productStock[indexPath.row].productName) + "\n //\(String(productStock[indexPath.row].prodcutPrice))"
        */
        cell.detailTextLabel?.text = String(Products.getAllProducts()[indexPath.row].productQty)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        // print(indexPath)
        let selectedTrail = Products.getAllProducts()[indexPath.row].productName
        let selectQty = Products.getAllProducts()[indexPath.row].productQty
        let productPrice = Products.getAllProducts()[indexPath.row].prodcutPrice
        let totalAmount = Float(selectQty) * productPrice
        print(selectedTrail)
        if (selectedTrail != ""){
         
         txtInputProductName.text = selectedTrail
            lblTotalAmountShow.text = String(totalAmount)
         qtyShowtxt.text = String(selectQty)
         loadQty = selectQty
         
        }
         
         
     }

    override func viewDidLoad() {
        super.viewDidLoad()
        VIEWProductTbl.dataSource=self
        navigationItem.title = "Cash Register App"
       
    }

    @IBAction func addListbtn(_ sender: Any) {
       
        addForBuy = Int(qtyShowtxt.text!) ?? 0
        print("addforBuy\(addForBuy) And Load \(self.loadQty)")
        if(addForBuy > loadQty){ //if product Qty is more than availability
            
            let alert = UIAlertController(title: "Quantity Error", message: "Quantity exceed Avaliablity", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Update Quantity", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            qtyShowtxt.text = String(loadQty )
        }
        //Sales confirmation
        let alert = UIAlertController(title: "Do you want to add product to Cart?", message: "Are you sure?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "add", style: .default){ action
             in
            if let name = self.txtInputProductName.text {
               
                
              if self.lblTotalAmountShow.text != nil{
                    let total =
                  
                  
                  Int(self.lblTotalAmountShow.text!)
                    
                  //  let newProduct = Product(n: name, amount: total ?? 0)
                    
                let findProduct =   self.Products.getAllProducts()
                  
                  if let product_id = findProduct.firstIndex(where: {$0.productName == self.txtInputProductName.text}) {
                     // do something with foo
                      
                      var productQty=findProduct[product_id].productQty
                      var productName=findProduct[product_id].productName
                      var prodctPrice=findProduct[product_id].prodcutPrice
                
                     
                      
                      let  producth = ProductHistory(pName: productName, pQty:productQty, pPrice:Int(prodctPrice))
                      findProduct[product_id].productQty =  productQty - self.addForBuy
                      
                      self.vProductHistory.append(producth)
                      
                      self.clearPanel()
                      
                    
                      
                  }
                 
                    self.VIEWProductTbl.reloadData()
                  
                  
                }
                
            }
            
            
        }
        let action2 = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        alert.addAction(action1)
        alert.addAction(action2)

         present(alert,animated: true, completion:  nil )
        
        
    }
    
    func clearPanel()->Void {
        txtInputProductName.text = ""
        lblTotalAmountShow.text = ""
        qtyShowtxt.text = ""
    }
    
    @IBAction func btn1(_ sender: Any) {
        
        qtyShowtxt.text = qtyShowtxt.text! + "1"
        
       
    }
    
    @IBAction func btn2(_ sender: Any) {
        qtyShowtxt.text = qtyShowtxt.text! + "2"
       


    }
    
    @IBAction func btn3(_ sender: Any) {
    
        qtyShowtxt.text = qtyShowtxt.text! + "3"
       
    }
    
    @IBAction func btn4(_ sender: Any) {
        qtyShowtxt.text = qtyShowtxt.text! + "4"
       
    }
    @IBAction func btn5(_ sender: Any) {
        qtyShowtxt.text = qtyShowtxt.text! + "5"
       
    }
    
    @IBAction func btn6(_ sender: Any) {
        qtyShowtxt.text = qtyShowtxt.text! + "6"
       
    }
    
    @IBAction func btn7(_ sender: Any) {
        qtyShowtxt.text = qtyShowtxt.text! + "7"
       
    }
    @IBAction func btn8(_ sender: Any) {
        qtyShowtxt.text = qtyShowtxt.text! + "8"
       
    }
    @IBAction func btn9(_ sender: Any) {
        qtyShowtxt.text = qtyShowtxt.text! + "9"
       
    }
    @IBAction func btn0(_ sender: Any) {
      
        qtyShowtxt.text = qtyShowtxt.text! + "0"
        
    }
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toManagerPage"){
            
            let ManagerView = segue.destination as? ManagerViewController
            ManagerView!.ProductVar = Products
        }
        
       
   
    
    }
  
    
    
}

