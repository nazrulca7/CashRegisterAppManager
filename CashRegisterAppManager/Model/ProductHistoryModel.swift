//
//  ProductHistoryModel.swift
//  CashRegisterAppManager
//
//  Created by Md Nazrul Islam on 2021-10-25.
//

import Foundation


class ProductHistoryModel{

    
    var MyProductHistory = [ProductHistory]()
   
    func addNewHistoryProduct(newproduct: ProductHistory){
        MyProductHistory.append(newproduct)
    }
    
    func getAllhistoryProducts()->[ProductHistory]{
        return MyProductHistory
    }
    
    
}
