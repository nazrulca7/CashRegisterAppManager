//
//  HistoryViewController.swift
//  CashRegisterAppManager
//
//  Created by Md Nazrul Islam on 2021-10-25.
//

import UIKit

class HistoryViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var HistoryModel : ProductHistoryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (HistoryModel?.getAllhistoryProducts().count) as! Int
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
