//
//  ViewController.swift
//  project-basic-table-view
//
//  Created by cheng on 2016/5/3.
//  Copyright © 2016年 reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

//    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var foodTableVeiw: UITableView!
    
    var foodItems = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        foodItems = ["黃金炒飯", "迷魔幻麻婆豆腐", "炒青江菜", "南鮮青椒肉絲", "畢拉夫什錦炒飯", "番茄燴炒飯", "叫化子雞"]
        navigationItem.leftBarButtonItem = editButtonItem()
//        self.foodTableVeiw.editing = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell", forIndexPath: indexPath) as UITableViewCell
        let item = foodItems[indexPath.row]
        cell.textLabel?.text = item.description
        
        return cell
    }
    
    // conditional editing of the table view.
//    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
//        return true
//    }
    
    // editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
//            supermanItems.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
//    add editing action
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.foodTableVeiw.setEditing(editing, animated: animated)
    }
    
    
//    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
//            
//    }

}

