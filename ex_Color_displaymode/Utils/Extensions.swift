//
//  extension.swift
//  spacelog_MVVM
//
//  Created by iOS Dev on 2023/11/06.
//

import Foundation
import UIKit
import MapKit

extension Int {
    func currencyKR() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    func toString() -> String{
        return "\(self)"
    }
}

extension UITabBar {
    func setUpUITabBar(){
        self.backgroundImage = UIImage()
        self.shadowImage = UIImage()
        self.clipsToBounds = true
    }
}

extension UIColor {
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSizeMake(1, 1))
        let ctx = UIGraphicsGetCurrentContext()
        self.setFill()
        ctx!.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}

extension MKMapView{
    func show_Annotation_UserLocation(){
        let manager = CLLocationManager()
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        case .denied, .restricted:
            break
        case .authorizedAlways, .authorizedWhenInUse:
            showsUserLocation = true
            manager.startUpdatingLocation()
            
            if let currentUserLocation = manager.location?.coordinate{
                camera.centerCoordinate = CLLocationCoordinate2D(latitude: currentUserLocation.latitude, longitude: currentUserLocation.longitude)
            }
        @unknown default:
            break
        }
    }
}

extension UIResponder {

    private struct Static {
        static weak var responder: UIResponder?
    }

    static var currentResponder: UIResponder? {
        Static.responder = nil
        UIApplication.shared.sendAction(#selector(UIResponder._trap), to: nil, from: nil, for: nil)
        return Static.responder
    }

    @objc private func _trap() {
        Static.responder = self
    }
}

public extension UIControl {
//    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping () -> ()) {
//    }
    func addAction(for controlEvents: UIControl.Event = .touchUpInside, _ closure: @escaping () -> ()) {
        @objc class ClosureSleeve: NSObject {
            let closure: () -> ()
            
            init(_ closure: @escaping () -> ()) {
                self.closure = closure
            }
            
            @objc func invoke() {
                closure()
            }
        }
        
        let sleeve = ClosureSleeve(closure)
        addTarget(sleeve, action: #selector(ClosureSleeve.invoke), for: controlEvents)
        objc_setAssociatedObject(self, "\(UUID())", sleeve, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
}

extension UIView {
    func addTopBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: -1, width: self.frame.size.width, height: width)
//        self.layer.addSublayer(border)
        self.clipsToBounds = false
        self.addSubview(border)
    }
    
    func addRightBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
//        let border = CALayer()
        let border = UIView()
        border.backgroundColor = color
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
        self.addSubview(border)
//        self.layer.addSublayer(border)
    }

    func addLeftBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
        self.layer.addSublayer(border)
    }
}

extension Date{
    func toString() -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd_HH:mm:ss"
        return dateFormatter.string(from: self)
    }
}

extension CLLocation: Encodable {
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
        case altitude
        case horizontalAccuracy
        case verticalAccuracy
        case speed
        case course
        case timestamp
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(coordinate.latitude, forKey: .latitude)
        try container.encode(coordinate.longitude, forKey: .longitude)
        try container.encode(altitude, forKey: .altitude)
        try container.encode(horizontalAccuracy, forKey: .horizontalAccuracy)
        try container.encode(verticalAccuracy, forKey: .verticalAccuracy)
        try container.encode(speed, forKey: .speed)
        try container.encode(course, forKey: .course)
        try container.encode(timestamp, forKey: .timestamp)
    }
}

extension CLLocationCoordinate2D: Encodable{
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(latitude, forKey: .latitude)
        try container.encode(longitude, forKey: .longitude)
    }
    enum CodingKeys: String, CodingKey {
        case latitude
        case longitude
    }
}

#if DEBUG
//swiftUI를 활용한 Xcode상의 프리뷰 코드
// The following values are supported:
//
//     "iPhone 8"
//     "iPhone 8 Plus"
//     "iPhone SE"
//     "iPhone 11"
//     "iPhone 11 Pro"
//     "iPhone 11 Pro Max"
//     "iPad mini 4"
//     "iPad Air 2"
//     "iPad Pro (9.7-inch)"
//     "iPad Pro (12.9-inch)"
//     "iPad (5th generation)"
//     "iPad Pro (12.9-inch) (2nd generation)"
//     "iPad Pro (10.5-inch)"
//     "iPad (6th generation)"
//     "iPad Pro (11-inch)"
//     "iPad Pro (12.9-inch) (3rd generation)"
//     "iPad mini (5th generation)"
//     "iPad Air (3rd generation)"
//     "Apple TV"
//     "Apple TV 4K"
//     "Apple TV 4K (at 1080p)"
//     "Apple Watch Series 2 - 38mm"
//     "Apple Watch Series 2 - 42mm"
//     "Apple Watch Series 3 - 38mm"
//     "Apple Watch Series 3 - 42mm"
//     "Apple Watch Series 4 - 40mm"
//     "Apple Watch Series 4 - 44mm"
import SwiftUI

@available(iOS 13, *)
extension UIViewController {
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController

        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        }
    }

    func toPreview() -> some View {
        // inject self (the current view controller) for the preview
        Preview(viewController: self)
    }
}
#endif
