//
//  Product.swift
//  CashRegisterApp
//
//  Created by Md Nazrul Islam on 2021-10-14.
//

import Foundation

class Product{
    
  
    var MyProductStock = [ProductStock]()
 
    
    init(){
    
        MyProductStock.append(ProductStock(pName: "Pant", pQty:20, pPrice:50.7))
        MyProductStock.append(ProductStock(pName: "Shoes", pQty:50, pPrice:90))
        MyProductStock.append(ProductStock(pName: "Hates", pQty:10, pPrice:20.5))
        MyProductStock.append(ProductStock(pName: "T-Shirts", pQty:10, pPrice:10))
        MyProductStock.append(ProductStock(pName: "Dresses", pQty:24, pPrice:10))
    }
    
    func addNewProduct(newproduct: ProductStock){
            MyProductStock.append(newproduct)
    }
    
    func getAllProducts()->[ProductStock]{
        return MyProductStock
    }
    
    
    
    
}
