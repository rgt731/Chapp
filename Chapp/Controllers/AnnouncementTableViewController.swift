//
//  AnnouncementTableViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/16/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class AnnouncementTableViewController: UITableViewController {

    var data: [Announcement]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data = DataSet.announcementData
        
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
      
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "announcementCell", for: indexPath)
        // Configure the cell...
        if let announcementCell = cell as? AnnouncementTableViewCell {
            if let therealdata = data {
                let announcement = therealdata[indexPath.row]
                
                announcementCell.AnnouncementTitle?.text = announcement.title
               //announcementCell.
                
                if let imageName = announcement.imageName {
                    announcementCell.backgroundImage?.image = UIImage(named: imageName)
                }
                else {
                    announcementCell.backgroundImage.image = nil
                }
                
                if let imageURL = announcement.imageURL {
                    loadImageViewAsyc(imageURL: imageURL, imageView: announcementCell.backgroundImage)
                    
                }
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
    
    func loadImageViewAsyc( imageURL: String , imageView: UIImageView) {
        if let url = URL(string: imageURL) {
            let dataTask = URLSession(configuration: .default).dataTask(with: url){ (data, response, error) in
                if let error = error {
                    print("ERROR: \(error.localizedDescription)")
                } else if let data = data {
                    DispatchQueue.main.async {
                        imageView.image = UIImage(data: data)
                    }
                }
            }
            dataTask.resume()
        }
    }

    /*
    // MARK: - Navigation*/

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "announcementSegue" {
                if let avc = segue.destination as? AnnouncementViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                        avc.announcement = data[indexPath.row]
                    }
                }
                
            }
        }
        
    }

}
