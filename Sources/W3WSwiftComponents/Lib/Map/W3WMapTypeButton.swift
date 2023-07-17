//
//  File.swift
//  
//
//  Created by Dave Duprey on 18/08/2021.
//
#if !os(macOS) && !os(watchOS)

import Foundation
import UIKit
import W3WSwiftApi
import MapKit


public class W3WMapTypeButton: UIButton {
  
  
  public var tapped: (MKMapType) -> () = { _ in }

  public var mapType = MKMapType.standard
  
  public init(action: @escaping (MKMapType) -> ()) {
    super.init(frame: CGRect(origin: .zero, size: CGSize(width: 60.0, height: 60.0)))
    tapped = action
    position()
  }
  
  
  public init() {
    super.init(frame: CGRect(origin: .zero, size: CGSize(width: 60.0, height: 60.0)))
    position()
  }
  
  
  public required init?(coder: NSCoder) {
    super.init(coder: coder)
    position()
  }
  
  
  func position() {
    //layer.borderColor   = W3WSettings.color(named: "MapSquareColor").cgColor
    //layer.borderWidth    = 2.0
    layer.cornerRadius    = 30.0
    self.layer.shadowColor = UIColor.black.cgColor
    self.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
    self.layer.shadowRadius  = 1.0
    self.layer.shadowOpacity  = 0.5
    self.layer.masksToBounds   = false;
    
    addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    
    set(mapType: .standard)
  }
  
  
  func set(mapType: MKMapType) {
    self.mapType = mapType
    
    if mapType == .standard {
      setImage(UIImage(named: "sateliteIcon.png", in: W3WBundle.module, compatibleWith: nil), for: .normal)
    } else {
      setImage(UIImage(named: "mapIcon", in: W3WBundle.module, compatibleWith: nil), for: .normal)
    }
  }
  
  
  
  @objc func buttonWasTapped() {
    if mapType != .standard {
      set(mapType: .standard)
    } else {
      set(mapType: .satellite)
    }
    
    tapped(mapType)
  }
  
  
}

#endif
