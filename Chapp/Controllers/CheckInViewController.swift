//
//  CheckInViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/30/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit
import CoreLocation

class CheckInViewController: UIViewController, CLLocationManagerDelegate {

   
    /********************
      Status Indicators
     *********************/
    //status indicators in order : Wifi, Location, Success
    //wifi indicator picture
    @IBOutlet weak var Status1: UIImageView!
    //Location indicator picture
    @IBOutlet weak var Status2: UIImageView!
    //wSuccess indicator picture
    @IBOutlet weak var Status3: UIImageView!
    
    
    /********************
         Test Text
    *********************/
    //label for testing purposes - show current IP Address
    @IBOutlet weak var ipText: UILabel!
    //Label for testing purposes - show current GPS location
    @IBOutlet weak var gpsText: UILabel!
    
    
    let locationManager =  CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //check wifi status
        checkWifi()
        
        //check location status
        checkLocation()
        
        //request access to location
        //for when the app is open and in the background
        locationManager.requestAlwaysAuthorization()
        
        //for when app is open
        // locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        
        //check both are corect
        checkLocationWifi()

   
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /******************************************************************
     *********                  Wifi                      *************
     ******************************************************************/
    
    //Its about to go down
    //A: Did user have the correct Wifi IP Address?
    func checkWifi(){
        
        Status1.isHidden = false
        Status1.image = UIImage(named: "yes.png")
        
        let addr = getIFAddresses()
        if (addr.count > 0){
                    print (addr[0])
                    ipText.text! = addr[0]
                  //  return true
        }else{
            print("Array has 0 items ")
            //return false

        }

    }
    
    
    
    //function to get IP Address
    func getIFAddresses() -> [String] {
        var addresses = [String]()
        
        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return [] }
        guard let firstAddr = ifaddr else { return [] }
        
        // For each interface ...
        for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let flags = Int32(ptr.pointee.ifa_flags)
            let addr = ptr.pointee.ifa_addr.pointee
            
            // Check for running IPv4, IPv6 interfaces. Skip the loopback interface.
            if (flags & (IFF_UP|IFF_RUNNING|IFF_LOOPBACK)) == (IFF_UP|IFF_RUNNING) {
                if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                    
                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    if (getnameinfo(ptr.pointee.ifa_addr, socklen_t(addr.sa_len), &hostname, socklen_t(hostname.count),
                                    nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                        let address = String(cString: hostname)
                        addresses.append(address)
                    }
                }
            }
        }
        
        freeifaddrs(ifaddr)
        return addresses
    }
    
      /******************************************************************
      *********                  Location                   *************
      ******************************************************************/
      //Loyd's Lat and Long -----  Lat: 35.4384 Long: -88.6377
    
    
    //B: Is the User in the right location?
    func checkLocation(){
        Status2.isHidden = true
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       
        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
        var lat : String = locValue.latitude.description
        var lng : String = locValue.longitude.description
        
        if let location = locations.first{
            print(location.coordinate)

            gpsText.text! = location.coordinate
            //self.currentLocation = (CLLocationCoordinate2D){.latitude = 0.0, .longitude = 0.0};

        }
    }
    
    
    
    /******************************************************************
     *********                  Wifi / Location           *************
     ******************************************************************/
    
    //C: Are both A and B correct?
    func checkLocationWifi(){
        Status3.isHidden = false
        Status3.image = UIImage(named: "no.png")
    }
    
    
 

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
