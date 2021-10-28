//
//  ProductHistory.swift
//  CashRegisterApp
//
//  Created by Md Nazrul Islam on 2021-10-22.
//

import Foundation

class ProductHistory{
    
    var productName: String
    var productQty: Int
    var prodcutPrice: Float
    var productsaleTime: Date
   // let dateFormatter : DateFormatter = DateFormatter()
  
    
    init(pName:String, pQty:Int, pPrice: Float ){
        
   
    productName = pName
    productQty = pQty
    prodcutPrice = pPrice
   
    productsaleTime = Date()
        
        
        
    }
    
    
}
