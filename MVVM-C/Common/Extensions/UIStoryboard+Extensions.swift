//
//  UIViewControllers+Extensions.swift
//  MVVM-C-Example
//
//  Created by Serge Mbamba on 2023/03/20.

import Foundation
import UIKit

extension UIStoryboard {

   enum Storyboard: String {
       case main
       var filename: String {
           return rawValue.capitalized
       }
   }
   
   class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
       return UIStoryboard(name: storyboard.filename, bundle: bundle)
   }
   
}

extension StoryboardViewControllerInitializer where Self: Coordinator {
   static var storyboardName: UIStoryboard.Storyboard {
       return UIStoryboard.Storyboard.main
   }
   
    static func instantiateViewController<T: StoryboardViewController>(_ type: T.Type) -> T {
       let storyboard = UIStoryboard.storyboard(storyboard: storyboardName)
        guard let viewController =  storyboard.instantiateViewController(withIdentifier: type.storyboardIdentifier) as? T else {
            fatalError("Could not build view controller of type \(Swift.type(of: T.self))")
       }
       return viewController
       
   }
}
