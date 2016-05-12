//
//  ViewController.swift
//  project-basic-table-view
//
//  Created by cheng on 2016/5/3.
//  Copyright © 2016年 reyes. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var foodTableVeiw: UITableView!
    
    var refreshControl: UIRefreshControl?
    let alertController = UIAlertController(title: "Oops！", message: "小當家沒菜了", preferredStyle: .Alert)
    
    //  model
    var foodNormalItems = Food().CookName(Food.Cooking.normal)
    var foodSpecialItems = Food().CookName(Food.Cooking.special)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 在 nav bar 左邊加入 edit button
        navigationItem.leftBarButtonItem = editButtonItem()
        
        // 讓 refreshControl 增加一個 target，然後指定哪一個 view 要執行 action，在什麼事件觸發
        refreshControl = UIRefreshControl()
        refreshControl!.addTarget(self, action: #selector(ViewController.refreshFoodItem), forControlEvents: UIControlEvents.ValueChanged)
        foodTableVeiw.addSubview(refreshControl!)
        
        // alert 視窗 style
        alertController.addAction(UIAlertAction(title: "呿", style: .Default, handler: nil))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNormalItems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FoodCell", forIndexPath: indexPath) as UITableViewCell
        let item = foodNormalItems[indexPath.row]
        cell.textLabel?.text = item.description
        
        return cell
    }
    
    // editing the table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            foodNormalItems.removeObjectAtIndex(indexPath.row)
            foodTableVeiw.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    // 將 edit action 與 foodTableView 關聯
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.foodTableVeiw.setEditing(editing, animated: animated)
    }
    
    func refreshFoodItem() {
        if let rand: Int? = Int(arc4random_uniform(UInt32(foodSpecialItems.count))) {
            // 當沒有菜可以增加時，氣到xx彈出來            
            if (foodSpecialItems.count == 0) {
                refreshControl?.endRefreshing()
                self.presentViewController(alertController, animated: true, completion: nil)
                return
            } else {
                foodNormalItems.insertObject(foodSpecialItems[rand!], atIndex: 0)
                foodSpecialItems.removeObjectAtIndex(rand!)
                foodTableVeiw.reloadData()
                refreshControl?.endRefreshing()
            }
        }
    }
    
    // 接收從 unwind segue 傳回來的 data
    @IBAction func unwindFoodView(segue: UIStoryboardSegue) {
        //  print(segue.identifier)
        if let unwindID = segue.identifier {
            if (unwindID == "unwindToViewController") {
                let unwind = segue.sourceViewController as? FoodDetailsViewController
                
                foodNormalItems.insertObject((unwind?.foodTextView.text)!, atIndex: 0)
                foodTableVeiw.reloadData()
                
            }
        }
        
    }
}

