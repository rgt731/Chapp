//
//  ParticipantTableViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/30/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class ParticipantTableViewController: UITableViewController {

    var chapelProgram: ChapelProgram?
    //var data: [Participant]?
    //date items
    //day of program
    @IBOutlet weak var dayOfProgram: UILabel!
    //month of program
    @IBOutlet weak var monthOfProgram: UILabel!
    //title of chapel program
    @IBOutlet weak var chapelTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      /*  let date = Date()
        let units: Set<Calendar.Component> = [.hour, .day, .month, .year]
        let comps = Calendar.current.dateComponents(units, from: date)*/
        
        print(" ---> ",(Calendar.current.component(.hour, from: Date())),":",
              (Calendar.current.component(.minute, from: Date())),":",
              (Calendar.current.component(.second, from: Date())))
        
        //new code will be:
        
        let date = Date()
        let calendar = Calendar.current
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        
        dateFormatter.dateFormat = "EEEE, MMMM dd, yyyy"
        let currentDateString: String = dateFormatter.string(from: date)
     
        
        let currentYear = calendar.component(.year, from: date)
        let currentMonth = calendar.component(.month, from: date)
        let currentDay = calendar.component(.day, from: date)
    
        
       /* print("Current Date" , currentYear, currentMonth, currentDay)
        print("Current date is \(currentDateString)")
        print("Current date is \(currentDateString)")*/
       // monthOfProgram.text = chapelProgram?.date.day
         let stringChapelDateDay = chapelProgram?.date?.description
         dayOfProgram.text = stringChapelDateDay
         chapelTitle.text = chapelProgram?.title
         print ("Chapel date is", chapelProgram?.date?.description)
         print ("Chapel date is", chapelProgram?.date!)
         print ("Chapel date is", chapelProgram?.date?.timeIntervalSinceNow)
         print ("Chapel date is", stringChapelDateDay?.description)
        
        
         dayOfProgram.text = self.date()
        print("New Day is : ",dayOfProgram.text)

        
        // title.text = chapelProgram.title
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
        if let participants = chapelProgram?.participants {
            return participants.count
        }
        else
        {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "participantCell", for: indexPath)

        // Configure the cell...

        if let participants = chapelProgram?.participants {
            cell.textLabel?.text = participants[indexPath.row].name
            cell.detailTextLabel?.text = participants[indexPath.row].job
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let identifier = segue.identifier {
            if identifier == "participantSegue" {
                if let pvc = segue.destination as? ParticipantViewController,
                    let cell = sender as? UITableViewCell,
                    let data = data {
                    if let indexPath = tableView.indexPath(for: cell) {
                       // pvc.participant = data[indexPath.row]
                    }
                }
                
            }
        }
        
    }*/
    


}


    




