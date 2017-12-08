//
//  CheckInViewController.swift
//  Chapp
//
//  Created by Robert Thompson on 11/30/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class CheckInViewController: UIViewController, CLLocationManagerDelegate {

    @IBAction func dismissViewController(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        locationManager.stopUpdatingLocation()
    }
    
    var wifiWasSuccessful = false
    var locationWasSuccessful = false

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
  //  @IBOutlet weak var ipText: UILabel!
    @IBOutlet weak var ipText: UILabel!
    //Label for testing purposes - show current GPS location
    @IBOutlet weak var gpsTextLat: UILabel!
    @IBOutlet weak var gpsTextLong: UILabel!
    
    /********************
             Map
     *********************/
    //the actual map
    @IBOutlet weak var map: MKMapView!
    let locationManager =  CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //check wifi status
        checkWifi()
        
        //check location status
        checkLocation()
        
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
        let addr = getIFAddresses()
       // let myFloat = (addr as String).doubleValue
       // let width = NSString(string: addr).doubleValue
        let first4 = addr[0].prefix(4)
        let double_1 : Double = (first4 as NSString).doubleValue
        
        /*****************************************
                   Wifi Authentication
         ******************************************/
        // Create a range and authenticate
        //range should be  - 10.5.32.0/19.
        let contains = (10.2...10.5).contains(double_1)
        if (contains == true){
                print("\n You are on the correct IP Address ", double_1, "\n")
                Status1.image = UIImage(named: "yes.png")
                wifiWasSuccessful = true
                 print("Wifi worked - set true")
        }else{
               print("\n You are on the wrong IP Address ", double_1, "\n")
            Status1.image = UIImage(named: "no.png")
             wifiWasSuccessful = false
                 print("Wifi worked - set false")
        }
        
        //debugging
      
       /* for a in addr {
          //  print(a + "\n")
        }*/
        
        if (addr.count > 0){
           // print (addr[0])
            ipText.text! = addr[0]
            //  return true
        }else{
            print("Array has 0 items ")
            //return false

        }
        
        //check both are corect
        checkLocationWifi()

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
                if addr.sa_family == UInt8(AF_INET) /*|| addr.sa_family == UInt8(AF_INET6)*/ {
                    
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
        Status2.isHidden = false
        
        //request access to location
        //for when the app is open and in the background
        locationManager.requestAlwaysAuthorization()
        
        //for when app is open
        // locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled()
        {
            locationManager.delegate = self
            //need accurate data
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            //get user location when user is using app
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
   /*
    func centerOnLocation(location: CLLocationCoordinate2D) {
        let regionRadius: CLLocationDistance = 1000
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }
    */
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // lat :35.4384 long : -88.6377
        
        if let location = locations.first{
            print(location.coordinate)
            
            //format lat and long
            let lat = String(format: "%.3f", location.coordinate.latitude)
            let long = String(format: "%.3f", location.coordinate.longitude)
            
            //compute distance between your location and the locatuion you care about
            //once loocation doesnt change as much then we believe that you are really here
            
            //assign lat and long to check in status
            gpsTextLat.text! = "\(lat)"
            gpsTextLong.text! = "\(long)"
            
            
            /*****************************************
                       Location Authentication
            ******************************************/
            
            if (lat == "35.439" && long == "-88.638"){
                print ("That is the CORRECT Coordinates ", lat, long, "\n")
                Status2.image = UIImage(named: "yes.png")
                locationWasSuccessful = true
                print("Location worked - set true")

            }else{
                 Status2.image = UIImage(named: "no.png")
                 locationWasSuccessful = false
                     print("Location did not work - set false")
                       print ("Nope, Coordinates not correct ", lat, long, "\n")
            }
            
            //center on map on user location
            let span:MKCoordinateSpan = MKCoordinateSpanMake(0.001, 0.001)
            let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
            let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
            map.setRegion(region, animated: true)
            self.map.showsUserLocation = true
            
            
            //set where loyd is
            let chapelLocation = CLLocationCoordinate2DMake(35.4384, -88.6377)
            // Drop a pin
            let dropPin = MKPointAnnotation()
            dropPin.coordinate = chapelLocation
            dropPin.title = "Loyd"
            /* dropPin.canShowCallOut = true
            dropPin.calloutOffset = CGPoint(x: -5, y : 5)
            dropPin.rightCalloutAccessoryView = UIButton( type: .detailDisclosure)
            dropPin.markerTintColor = blue
            dropPin.glyphImage = UIImage(named: "chevron-icon")*/
            map.addAnnotation(dropPin)
            //check both are corect
            checkLocationWifi()
            //self.currentLocation = (CLLocationCoordinate2D){.latitude = 0.0, .longitude = 0.0};
        }
    }
    
    /******************************************************************
     *********                  Wifi / Location           *************
     ******************************************************************/
    
    //C: Are both A and B correct?
    func checkLocationWifi(){
        Status3.isHidden = false
        
        /*****************************************
               Wifi/Location Authentication
         ******************************************/
        
        if (wifiWasSuccessful == true && locationWasSuccessful == true){
                    Status3.image = UIImage(named: "yes.png")
                    print("Authenticated")
            
                    //***************************************************************
                    //do things that let server know you have checked in successfully
        }
        else{
                    Status3.image = UIImage(named: "no.png")
                     print("Not authenticated")
        }
    }
}















