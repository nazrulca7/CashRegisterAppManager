//
//  RestockViewController.swift
//  CashRegisterAppManager
//
//  Created by Md Nazrul Islam on 2021-10-25.
//

import UIKit

class RestockViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
   
    var ProductVar : Product  = Product()
    
    @IBOutlet weak var reStockTblView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return (ProductVar.getAllProducts().count)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allProduct = ProductVar.getAllProducts()
        let cell = tableView.dequeueReusableCell(withIdentifier: "restockcell")!
        print(ProductVar)
        cell.textLabel?.text = String(allProduct[indexPath.row].productName) + "\n \(String(allProduct[indexPath.row].prodcutPrice))"
        cell.detailTextLabel?.text = String(allProduct[indexPath.row].productQty)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        reStockTblView.dataSource = self
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
