//
//  GlowingCircularImageView.swift
//  Lesson-07 UIImageView
//
//  Created by Adam的Apple on 2024/4/9.
//

import UIKit

class GlowingCircularImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()

        // 确定圆的直径
        let diameter = min(bounds.width, bounds.height)

        // 计算圆的边界矩形，使得圆居中于视图
        let originX = (bounds.width - diameter) / 2
        let originY = (bounds.height - diameter) / 2
        let circularPathRect = CGRect(x: originX, y: originY, width: diameter, height: diameter)

        // 创建圆形遮罩
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(ovalIn: circularPathRect).cgPath

        //将遮罩应用到图层
        layer.mask = maskLayer

        // 创建边框图层
        let borderLayer = CAShapeLayer()
        borderLayer.path = maskLayer.path
        // 设置边框宽度
        borderLayer.lineWidth = 3.0
        // 设置边框颜色
        borderLayer.strokeColor = UIColor.golden.cgColor
        // 无填充
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.frame = bounds
        // 添加边框图层
        layer.addSublayer(borderLayer)

        // 创建发光效果
        let glowLayer = CAShapeLayer()
        glowLayer.path = maskLayer.path
        // 设置发光边框宽度
        glowLayer.lineWidth = 8.0
        // 设置发光颜色
        glowLayer.strokeColor = UIColor.golden.cgColor
        // 无填充
        glowLayer.fillColor = UIColor.clear.cgColor
        glowLayer.frame = bounds
        // 设置阴影颜色
        glowLayer.shadowColor = UIColor.golden.cgColor
        // 设置阴影偏移量
        glowLayer.shadowOffset = CGSize.zero
        // 设置阴影不透明度
        glowLayer.shadowOpacity = 1.0
        // 设置阴影半径
        glowLayer.shadowRadius = 10.0
        // 将发光效果添加到边框图层上
        borderLayer.addSublayer(glowLayer)

        // 创建发光效果的动画
        let glowAnimation = CABasicAnimation(keyPath: "opacity")
        // 从透明开始
        glowAnimation.fromValue = 0.0
        // 完全显示
        glowAnimation.toValue = 1.0
        // 持续时间
        glowAnimation.duration = 1.0
        // 自动反转
        glowAnimation.autoreverses = true
        // 无限重复
        glowAnimation.repeatCount = .infinity
        // 将动画应用到发光效果图层上
        glowLayer.add(glowAnimation, forKey: "glowAnimation")

    }
}

extension UIColor {
    static var golden: UIColor {
        return UIColor(red: 1.0, green: 0.843, blue: 0.0, alpha: 1.0)
    }
//    static var golden: UIColor {
//        return UIColor(red: 1.0, green: 0.9, blue: 0.5, alpha: 1.0)
//    }
}
