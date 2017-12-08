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

    //date items
    //day of program
    @IBOutlet weak var dayOfProgram: UILabel!
    //month of program
    @IBOutlet weak var monthOfProgram: UILabel!
    //title of chapel program
    @IBOutlet weak var chapelTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //get day of chapel
        if let correctDay = chapelProgram?.getChapelProgramDateDay(){
            dayOfProgram.text = correctDay.description
            print("Particpant day",correctDay.description)
        }
        
        //get month of program
        if let correctMonth = chapelProgram?.getChapelProgramDateMonth(){
        
        monthOfProgram.text = getMonthString(monthNumber: correctMonth)
        }
        
        //get chapel program
        chapelTitle.text = chapelProgram?.title
        
        //set picture
        
 
     

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
    
    func getMonthString(monthNumber: Int) -> String {
        switch monthNumber{
        case 1:
            print("JAN")
            return "JAN"
        case 2:
            print("FEB")
            return"FEB"
        case 3:
            print("MAR")
            return "MAR"
        case 4:
            print("APR")
            return "APR"
        case 5:
            print("MAY")
            return "MAY"
        case 6:
            print("JUN")
            return "JUN"
        case 7:
            print("JUL")
            return "JUL"
        case 8:
            print("AUG")
            return "AUG"
        case 9:
            print("SEP")
            return "SEP"
        case 10:
            print("OCT")
            return "OCT"
        case 11:
            print("NOV")
            return "NOV"
        case 12:
            print("DEC")
            return "DEC"
        default:
            print("Date Not available")
            return ""
            
        }
        
    }
    


}


    




