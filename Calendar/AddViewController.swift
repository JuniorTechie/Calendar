//
//  AddViewController.swift
//  Calendar
//
//  Created by Solomon Kim on 10/25/15.
//  Copyright © 2015 Solomon Kim. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var Time: UIDatePicker!
    @IBOutlet weak var Name: UITextField!
    @IBAction func datePickerAction(sender: AnyObject) {
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
        var strDate = dateFormatter.stringFromDate(Time.date)
        selectedDate = strDate
        var dateFormatter1 = NSDateFormatter()
        dateFormatter1.dateFormat = "dd"
        date = dateFormatter1.stringFromDate(Time.date)
        var dateFormatter2 = NSDateFormatter()
        dateFormatter2.dateFormat = "MM"
        month = dateFormatter2.stringFromDate(Time.date)
        var dateFormatter3 = NSDateFormatter()
        dateFormatter3.dateFormat = "yyyy"
        year = dateFormatter3.stringFromDate(Time.date)
        
        m.text = month
        day.text = date
        y.text = year
        selectDate.text = selectedDate
    }
    var month = ""
    var date = ""
    var year = ""
    
    @IBOutlet weak var m: UILabel!
    @IBOutlet weak var day: UILabel!
    @IBOutlet weak var y: UILabel!
    @IBOutlet weak var selectDate: UILabel!
    
    
    var selectedDate = ""
    
    
    var HoldData = event();
    
    func setStructDataReference(structDataReference:event)
    {
        self.HoldData = structDataReference;
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        HoldData.NameOfEvent = Name.text!
        HoldData.month = month
        HoldData.day = date
        HoldData.year = year
        
        
        if segue.identifier == "Add"
        {
            print(HoldData.NameOfEvent)
            let hData:[event] = [HoldData]
            if hData.isEmpty
            {
                print("empty")
            }
            else
            {
                print("has data")
            }
            eventHolder += [HoldData]
            if eventHolder.isEmpty
            {
                print("eventHolder empty")
            }
            newItems++;
        }
        
    }
    

}
