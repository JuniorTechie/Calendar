//
//  OriginalTableViewController.swift
//  Calendar
//
//  Created by Solomon Kim on 10/26/15.
//  Copyright © 2015 Solomon Kim. All rights reserved.
//

import UIKit

struct event {
    var month = ""
    var day = ""
    var year = ""
    var NameOfEvent = ""
    init(){}
}
var eventHolder:[event] = []
var newItems = 0;
class OriginalTableViewController: UITableViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkEmpty()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func checkEmpty()
    {
        if eventHolder.isEmpty
        {
            print("eventHolder empty")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */
    
    
    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var addEvents:[event] = []
        var counter = 0
        if segue.identifier == "October"{
            for(var i = 0; i < eventHolder.count; i++)
            {
                if(eventHolder[i].month == "10" && newItems != 0)
                {
                    addEvents.append(eventHolder[i])
                    counter++
                }
            }
            if counter == eventHolder.count
            {
                eventHolder = []
                newItems = 0
            }
            else
            {
                var aHold:[event] = []
                for(var z = 0; z < eventHolder.count; z++)
                {
                    if(eventHolder[z].month != "10")
                    {
                        aHold.append(eventHolder[z])
                    }
                }
                eventHolder = aHold
            }
            if let destinationVC = segue.destinationViewController as? OctTableViewController{
                for(var k = 0; k < addEvents.count; k++)
                {
                    destinationVC.PassedEvents.append(addEvents[k])
                }
            }
        }
        if segue.identifier == "Adding"
        {
            if let destinationVC = segue.destinationViewController as? AddViewController
            {
                let newEvent = event()
                destinationVC.setStructDataReference(newEvent)
            }
        }
    }
    

}
