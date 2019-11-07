//
//  InventoryViewController.swift
//  Inventory
//
//  Created by Megan Wilson on 11/6/19.
//  Copyright © 2019 Megan Wilson. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var inventoryTableView: UITableView!
    var inventory = Inventory.load(from: "inventory")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

   func numberOfSections(in tableView: UITableView) -> Int {
       return 1
   }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventory?.products.count ?? 0
    }
       
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "inventoryCell", for: indexPath)
           
           if let product = inventory?.products[indexPath.row] {
                cell.textLabel?.text = product.title
                cell.detailTextLabel?.text = "In stock: \(product.stockedQuantity), Price: $\(String(format: "%.2f", product.price)), Category: \(product.category)"
           }
           return cell
    }
}
