//
//  ParticipantViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 12/4/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit

class ParticipantViewController: UIViewController {
    
    var participant: Participant?
    
    @IBOutlet weak var prayerName: UILabel!
    @IBOutlet weak var prayerJob: UITextView!
  

    override func viewDidLoad() {
        super.viewDidLoad()
        
  //      participantName.text = participant?.name
    //    participantJob.text = participant?.description

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
