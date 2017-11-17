//
//  FirstViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/7/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation
import UIKit
import MapKit


class FirstViewController : UIViewController{
    
    override func viewDidLoad(){
        
            super.viewDidLoad()
    

    }

/*
    @IBAction func logOut(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    //function location manager
   /* let locationManager = CCLocationManager()
    func checkLocationAuthoriationStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            mapView.showsUserLocation = true
        }else{
            location
        }
    }*/
    
    override func viewDidAppear(_ animated: Bool) {
        
        let imageView  = UIImageView(frame: CGRect(x:0, y:0, width:80, height: 80))
        imageView.contentMode = .scaleAspectFit // set imageview's content mode
        
        let image = UIImage(named: "chapel")!
        imageView.image = image
        
        navigationItem.titleView = imageView
  */
        
       /* super.viewDidAppear(animated){
            checkLocationAuthorizationStatus()
        }*/
  //  }
    
}



















