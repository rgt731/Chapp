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
        
        //draw a line
        // Add a green line with thickness 1, width 200 at location (50, 100)
        //y is up/down x is left/right
      /*  let line = UIView(frame: CGRect(x: 50, y: 375, width: 300, height: 1))
        line.backgroundColor = UIColor.black
        self.view.addSubview(line)*/
        
        
        //map
        func centerOnLocation(location: CLLocationCoordinate2D) {
            let regionRadius: CLLocationDistance = 1000
            let coordinateRegion = MKCoordinateRegionMakeWithDistance(location, regionRadius, regionRadius)
            map.setRegion(coordinateRegion, animated: true)
        }

    
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
        //let type = type(of: value)
  
    //    print("first four letters of ip address are: ", first4)
    //    print("first four letters of ip address are: ", double_1, "Its type is ", double_1)
        

        
        
        // Create a range and authenticate
        //range should be  - 10.5.32.0/19.
        let contains = (10.5...10.5).contains(double_1)
        if (contains == true){
                print("\n You are on the correct IP Address ", double_1, "\n")
                Status1.image = UIImage(named: "yes.png")
                wifiWasSuccessful = true
        }else{
               print("\n You are on the wrong IP Address ", double_1, "\n")
            Status1.image = UIImage(named: "no.png")
        }
        
        /*  
        //authentication
        if ( first4 == "10.5" || first4 == "10.6")
        {
            if(double_1 == 10.5){
                print("This is an int: ", double_1)
            }else{
                    print("This is NOT an int: ", double_1)
            }
        
            Status1.image = UIImage(named: "yes.png")
        }
        else{
        
            Status1.image = UIImage(named: "no.png")
        }*/
 
        
        
        
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
        
        //authentication
        
        Status2.isHidden = false
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       /*
        var locValue:CLLocationCoordinate2D = manager.location!.coordinate
        var lat : String = locValue.latitude.description
        var lng : String = locValue.longitude.description
        */
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
            
            if (lat == "35.439" && long == "-88.638"){
                print ("That is the CORRECT Coordinates ", lat, long, "\n")
                Status2.image = UIImage(named: "yes.png")
                locationWasSuccessful = true
            }else{
                 Status2.image = UIImage(named: "no.png")
                       print ("Nope, Coordinates not right ", lat, long, "\n")
            }
            
            //center on map on user location
            let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
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
           
            //self.currentLocation = (CLLocationCoordinate2D){.latitude = 0.0, .longitude = 0.0};
        }
    }
    
    
    
    /******************************************************************
     *********                  Wifi / Location           *************
     ******************************************************************/
    
    //C: Are both A and B correct?
    func checkLocationWifi(){
        Status3.isHidden = false
        
        
        if (wifiWasSuccessful == true && locationWasSuccessful == true){
                    Status3.image = UIImage(named: "yes.png")
        }else{
                    Status3.image = UIImage(named: "no.png")
        }
         Status3.image = UIImage(named: "yes.png")
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
