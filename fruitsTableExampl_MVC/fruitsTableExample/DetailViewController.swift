//
//  DetailViewController.swift
//  fruitsTableExample
//
//  Created by user on 2/8/18.
//  Copyright © 2018 ASU. All rights reserved.
//

import UIKit
import MapKit

class DetailViewController: UIViewController {
    var selectedFruit:String?
    var selectedDescrip:String?
    var selectedImage:String?
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var descrip: UILabel!
    @IBOutlet weak var theRealOne: UITextView!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var Long: UILabel!
    @IBOutlet weak var Lat: UILabel!
    @IBOutlet weak var SearchItem: UITextField!
    @IBOutlet weak var Picker: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = selectedFruit
        theRealOne.text = selectedDescrip
        image.image = UIImage(named: selectedImage!)
        
        let geoCoder = CLGeocoder();
            let addressString = selectedFruit!
            CLGeocoder().geocodeAddressString(addressString, completionHandler:
                {(placemarks, error) in
                    
                    if error != nil {
                        print("Geocode failed: \(error!.localizedDescription)")
                    } else if placemarks!.count > 0
                        {
                        let placemark = placemarks![0]
                        let location = placemark.location
                        let coords = location!.coordinate
                        print(location)
                       
                        let span = MKCoordinateSpan.init(latitudeDelta: 0.05, longitudeDelta: 0.05)
                        let region = MKCoordinateRegion(center: placemark.location!.coordinate, span: span)
                        self.map.setRegion(region, animated: true)
                        let ani = MKPointAnnotation()
                        ani.coordinate = placemark.location!.coordinate
                        ani.title = placemark.locality
                        ani.subtitle = placemark.subLocality
                        self.map.addAnnotation(ani)
                        
                        self.Long.text = "Longitude:   \(location!.coordinate.longitude)"
                        self.Lat.text = "Latitude:     \(location!.coordinate.latitude)"
            // Do any additional setup after loading the view.
                        }
                })
        }
        


        // Do any additional setup after loading the view.


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func MapView(_ sender: Any) {
        switch(Picker.selectedSegmentIndex)
        {
        case 0:
            map.mapType = MKMapType.standard
        case 1:
            map.mapType = MKMapType.satellite
        default:
            map.mapType = MKMapType.standard
        }
    }
    

    @IBAction func Go(_ sender: Any) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = self.SearchItem.text
        request.region = map.region
        let search = MKLocalSearch(request: request)
        
        search.start {response, _ in
            guard let response =  response else {
                return
            }
            print(response.mapItems)
            var matchingItems:[MKMapItem] = []
            matchingItems = response.mapItems
            for i in 1...matchingItems.count - 1
            {
                let place = matchingItems[i].placemark
                let annotations = MKPointAnnotation()
                annotations.title = place.name
                annotations.coordinate = CLLocationCoordinate2DMake(place.location!.coordinate.latitude, place.location!.coordinate.longitude)
                self.map.addAnnotation(annotations)
            }
        }
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
