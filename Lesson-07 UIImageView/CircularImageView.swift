//
//  CircularImageView.swift
//  Lesson-07 UIImageView
//
//  Created by Adam的Apple on 2024/4/19.
//

import UIKit

class CircularImageView: UIImageView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = bounds.height / 2
        layer.masksToBounds = true
        layer.borderWidth = 2.0
        layer.borderColor = UIColor.orange.cgColor
        self.contentMode = .scaleToFill
    }

}
