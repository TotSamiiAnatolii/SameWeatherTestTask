//
//  LocationManager.swift
//  SameWeatherTestTask
//
//  Created by APPLE on 28.12.2023.
//

import Foundation
import CoreLocation
import RxSwift

final class LocationManager: NSObject {
    
    //MARK: - Properties
    
    private let locationManager = CLLocationManager()
    
    private var locationFetchCompletion: ((CLLocation) ->Void)?
    
    public var currentLocation = PublishSubject<CLLocation?>()
    
    private var location: CLLocation? {
        didSet {
            guard let location = location else {
                return
            }
            locationFetchCompletion?(location)
        }
    }
    
    //MARK: - Initializers
    override init() {
        super.init()
        getCurrentLocation {[weak self] loc in
            self?.currentLocation.onNext(loc)
        }
    }
    
    func getCurrentLocation(completion: @escaping ((CLLocation) ->Void)) {
        
        self.locationFetchCompletion = completion
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
}

//MARK: CLLocationManagerDelegate

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        locationManager.stopUpdatingLocation()
        self.location = location
        
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        location = nil
    }
}
