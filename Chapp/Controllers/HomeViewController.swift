//
//  HomeViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/17/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    
    var chapelProgram: ChapelProgram?

   //image to show failure or success
    @IBOutlet weak var failSuccessImage: UIImageView!
    //actual check in button
    @IBOutlet weak var checkInButtion: UIButton!
    //function for when the check in button is clicked
    
    //Date Items
    //Day
    @IBOutlet weak var dayOfProgram: UILabel!
    //Month
    @IBOutlet weak var monthOfProgram: UILabel!
    
    @IBOutlet weak var chapelSpeaker: UILabel!
    
    @IBAction func homeButtonClicked(_ sender: UIButton) {
        
       // checkInButtion.currentImage = UIImage(named: "button-click.png")
       // checkInButtion.image = UIImage(named: "button-click.png") //this should have worked
             //   mainImage.image = UIImage(named: "intro.image.jpg")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // dayOfProgram.text = chapelProgram?.date
 
       // navigationController?.navigationBar.barTintColor = .red
        
      //  chapelSpeaker.text = chapelProgram?.participants.
        //adding image in top nav bar
       /*  let imageView  = UIImageView(frame: CGRect(x:0, y:0, width:80, height: 80))
           imageView.contentMode = .scaleAspectFill // set imageview's content mode
           let image = UIImage(named: "chapel")!
           imageView.image = image
         
            navigationItem.titleView = imageView
         */
        
        //adding image in top nav bar
       /* let imageView  = UIImageView(frame: CGRect(x:0, y:0, width:0, height: 0))
        imageView.contentMode = .scaleAspectFill // set imageview's content mode
        let image = UIImage(named: "login")!
        imageView.image = image
        
        navigationItem.titleView = imageView*/
        
       //change back button color?
       // navigationController?.navigationBar.barTintColor = .purple
       // navigationController?.navigationBar.tintColor = .white
       //   [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
 
        


     
        //round button off when loading view
        //checkInButtion.layer.cornerRadius = 5.0

        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //handle if user successfully checked in
    private func handleCheckInSuccess(){
        let alert = UIAlertController(title: "Check In Success!", message: "You have successfully checked in!", preferredStyle : .alert)
        present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "OK", style :.default, handler: nil))
        
    }
    
    
   //handle if user did NOT check in
    private func handleCheckInFailure(){
        let alert = UIAlertController(title: "Check In Failure!", message: "There was an issue checking in!", preferredStyle : .alert)
        present(alert, animated: true)
        alert.addAction(UIAlertAction(title: "OK", style :.default, handler: nil))
    }
    
    

    
    // get today's chapel program object
    // set it as the chapelProgram member variable of the destiantion VC
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destinationViewController.
            // Pass the selected object to the new view controller.
            if let identifier = segue.identifier {
                if identifier == "participantSegue" {
                    if let pvc = segue.destination as? ParticipantTableViewController{
                        pvc.chapelProgram = DataSet.chapelProgramData
                    }
                }
            }
            
  
     
    }
 

}
