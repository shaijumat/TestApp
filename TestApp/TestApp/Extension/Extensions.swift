//
//  Extensions.swift
//  TestApp
//
//  Created by shaiju on 10/01/24.
//

import Foundation
import UIKit


extension UIImageView {
    ///  extension method for imageview to load image from server
    /// - Parameter userImageUrl: image url 
    func loadUserImage(userImageUrl: String) {
        DispatchQueue.global(qos: .userInteractive).async {
            guard let url = URL(string: userImageUrl ) else {return}
            guard let imageData = try? Data(contentsOf: url) else {return}
            let image = UIImage(data: imageData) ?? UIImage()
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}
