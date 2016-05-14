//
//  FoodDetailsViewController.swift
//  project-basic-table-view
//
//  Created by cheng on 2016/5/11.
//  Copyright © 2016年 reyes. All rights reserved.
//

import UIKit

protocol FoodDetailsViewDelegate {
    func setCook(cookName: String)
}

class FoodDetailsViewController: UIViewController, UITextViewDelegate {
    
    var data: String = ""
    var dataFormViewController: String = ""
    var delegate: FoodDetailsViewDelegate! = nil
    @IBOutlet weak var foodTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 改變 return key type
        foodTextView.returnKeyType = .Done
        foodTextView.delegate = self
        // Do any additional setup after loading the view.
        
        //  接收 preparesegue
        foodTextView.text = dataFormViewController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 偵測鍵盤動作
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
        
            dismissFoodView()
            return false
        }
        
        return true
    }
    
    //  回到前一頁，use segue，並且傳值
    func dismissFoodView() {
        performSegueWithIdentifier("unwindToViewController", sender: self)
        
    }
    
    @IBAction func returnSegue(sender: UIButton) {
        if let title = sender.currentTitle {
            print(title)
            delegate.setCook(title)
            self.navigationController?.popViewControllerAnimated(true)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
