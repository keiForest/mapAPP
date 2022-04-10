//
//  NextViewController.swift
//  Swift5MapAndProtocol
//
//  Created by 森啓亮 on 2022/04/10.
//

import UIKit
import CoreLocation
import MapKit

class NextViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var keyWordTF: UITextField!
    var mapView2: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyWordTF.delegate = self
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        keyWordTF.resignFirstResponder()
        if let searchKey = keyWordTF.text {
          //入力された文字をデバッグエリアの表示
          print(searchKey)
        
        
        let geocorder = CLGeocoder()
        geocorder.geocodeAddressString(searchKey, completionHandler: {(placemarks,error)in
            if let unwrapPlaceMark = placemarks {
                if let firstPlacemark = unwrapPlaceMark.first{
                    if let location = firstPlacemark.location{
                        let targetCoordinate = location.coordinate
                        print(targetCoordinate)
                        print("unko")
                        
                        let pin = MKPointAnnotation()

                        pin.coordinate = targetCoordinate
                        pin.title = searchKey
                        self.mapView2.addAnnotation(pin)

                        self.mapView2.region = MKCoordinateRegion(center: targetCoordinate, latitudinalMeters: 500.0, longitudinalMeters: 500.0)
                    }
                }
            }
        })
        }
        return true
    }

    @IBAction func OK(_ sender: Any) {
        dismiss(animated: true, completion:nil)
    }
}
