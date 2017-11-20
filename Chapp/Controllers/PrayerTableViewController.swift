//
//  PrayerTableViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/17/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class PrayerTableViewController: UITableViewController {

    var data: [Prayer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       data = DataSet.prayerData

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
         return data?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "prayerCell", for: indexPath)
        // Configure the cell...
        if let prayerCell = cell as? PrayerTableViewCell {
            if let therealdata = data {
                let prayer = therealdata[indexPath.row]
                
                prayerCell.PrayerTitle?.text = prayer.title
                prayerCell.PrayerDescription?.text = prayer.description
                
                // announcementCell.locationLabel?.text = villain.alias
                //prayerCell.timeLabel?.text = prayer.timestamp.description
                /*
                if let imageName = prayer.imageName {
                    prayerCell.backgroundImage?.image = UIImage(named: imageName)
                }
                else {
                    announcementCell.backgroundImage.image = nil
                }
                
                if let imageURL = announcement.imageURL {
                    loadImageViewAsyc(imageURL: imageURL, imageView: announcementCell.backgroundImage)
                    
                }*/
            }
        }
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
     // MARK: - Navigation*/
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "prayerSegue" {
                if let pvc = segue.destination as? PrayerViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                        pvc.prayer = data[indexPath.row]
                    }
                }
            }
        }
    }
}








