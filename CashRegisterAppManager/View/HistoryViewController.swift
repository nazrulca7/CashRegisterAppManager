//
//  HistoryViewController.swift
//  CashRegisterAppManager
//
//  Created by Md Nazrul Islam on 2021-10-25.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
   
    var HistoryModel : ProductHistoryModel?
    var SelectRowId : Int = -1
    @IBOutlet weak var tblHistoryshow: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblHistoryshow.dataSource = self
        navigationItem.title = "History Items"
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (HistoryModel?.getAllProductsCount()) as! Int 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let allProduct = HistoryModel!.getAllhistoryProducts()
        let cell = tableView.dequeueReusableCell(withIdentifier: "historyCell")!
        
        cell.textLabel?.text = String(allProduct[indexPath.row].productName)
        cell.detailTextLabel?.text = String(allProduct[indexPath.row].productQty)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
         
       
        SelectRowId = indexPath.row
        
          
          
      }

    
  
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let selectedIndex1 = self.tblHistoryshow.indexPath(for: sender as! UITableViewCell)
        let HistoryDtlView = segue.destination as? HistoryDtlViewController
        HistoryDtlView?.SelectRowId = selectedIndex1!.row
        HistoryDtlView?.HistoryModel =  HistoryModel
        
       
    }
    

}

