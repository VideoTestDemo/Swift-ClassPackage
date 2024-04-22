//
//  ViewController.swift
//  Lesson-07 UIImageView
//
//  Created by Adam的Apple on 2024/4/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //addImageView()
        addImageView2()
    }

    func addImageView() {
        //创建imageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        //设置图片
        imageView.image = UIImage(named: "scenery")
        //居中显示imageView
        imageView.center = view.center
        //设置imageView的显示模式 缩放适应scaleToFill
        imageView.contentMode = .scaleToFill
        //将图片设置成圆形
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = imageView.frame.height / 2
        //设置边框
        imageView.layer.borderWidth = 2.0
        //设置边框颜色
        imageView.layer.borderColor = UIColor.orange.cgColor
        imageView.clipsToBounds = true
        //添加imageView到视图中
        view.addSubview(imageView)
    }

    func addImageView2() {
        let circleImageView = CircularImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        circleImageView.center = view.center
        circleImageView.image = UIImage(named: "scenery")
        view.addSubview(circleImageView)
    }
}

