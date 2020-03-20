//
//  HomeViewController.swift
//  LoginChallenge
//
//  Created by Maria Fernanda on 19/3/20.
//  Copyright © 2020 Sergio Sanchez. All rights reserved.
//

import UIKit
import GoogleMaps

class HomeViewController: UIViewController {
    
    @IBOutlet weak var logOutButton: UIButton!
    
    var mapView: GMSMapView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpelements()
        
        GMSServices.provideAPIKey("AIzaSyDedeOozm_fqVu2BsyWykoR_UtMxPzr-lU")
        let camera = GMSCameraPosition.camera(withLatitude: 43.642820, longitude: -79.386980, zoom: 14.0)
//        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView = GMSMapView.map(withFrame: CGRect(x:0, y:0,
                                                       width: self.view.frame.size.width,
                                                       height: self.view.frame.size.height - 180),
                                     camera: camera)
        
        view.addSubview(mapView!)
        
        let marker  = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 43.642820, longitude: -79.386980)
        marker.title = "CN Tower"
        marker.snippet = "Toronto"
        marker.map = mapView

    }
    
    func setUpelements(){
        CustomUtils.styleHollowButton(logOutButton)
    }

    @IBAction func logOutTapped(_ sender: Any) {
        transitionToRoot()
    }
    
    func transitionToRoot(){
        
        let rootViewController = storyboard?.instantiateViewController(identifier: Constants.Stroyboard.rootViewController) as? ViewController
        
        view.window?.rootViewController = rootViewController
        view.window?.makeKeyAndVisible()
        
    }
}
