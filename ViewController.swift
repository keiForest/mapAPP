//
//  ViewController.swift
//  Swift5MapAndProtocol
//
//  Created by 森啓亮 on 2022/04/09.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var locationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 緯度・軽度を設定
        let location:CLLocationCoordinate2D
            = CLLocationCoordinate2DMake(35.68154,139.752498)
 
        mapView.setCenter(location,animated:true)
 
        // 縮尺を設定
        var region:MKCoordinateRegion = mapView.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
 
        mapView.setRegion(region,animated:true)
 
        // 表示タイプを航空写真と地図のハイブリッドに設定
        mapView.mapType = MKMapType.hybrid
    }

    @IBAction func toFind(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let nextVC = segue.destination as! NextViewController  //遷移先の画面を変数に代入できる。
            nextVC.mapView2 = mapView
    }
    
}

