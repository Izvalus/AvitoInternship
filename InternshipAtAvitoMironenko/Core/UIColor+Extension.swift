//
//  UIColor+Extension.swift
//  InternshipAtAvitoMironenko
//
//  Created by Роман Мироненко on 10.01.2021.
//  Copyright © 2021 Роман Мироненко. All rights reserved.
//

import UIKit

extension UIColor {
    func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { rendererContext in
            setFill()
            rendererContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}
