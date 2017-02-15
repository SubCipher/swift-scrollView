//
//  ViewController.swift
//  WorkingWIthViewsInCode
//
//  Created by knax on 2/15/17.
//  Copyright © 2017 StepwiseDesigns. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet {
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.08
            scrollView.maximumZoomScale = 4.0
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return sourceImageView
    }
    
    var sourceImageView = UIImageView()
    
    var sourceImage: UIImage? {
        get{
            return sourceImageView.image
        }
        set {
            sourceImageView.image = newValue
            sourceImageView.frame.size = sourceImageView.intrinsicContentSize
            scrollView?.contentSize = sourceImageView.frame.size
            scrollView.frame.size = view.frame.size
        }
    }
    func setImage(){
        sourceImage = #imageLiteral(resourceName: "marvelUniverse")
        sourceImageView.image = sourceImage
    }
    
    func createTextField(_ textCGRect:CGRect, bgColor: UIColor, colorForText: UIColor) -> UITextField{
        
        let textRect = textCGRect
        let textField = UITextField(frame: textRect)
        textField.attributedPlaceholder = NSAttributedString(string: "PlaceHolder", attributes:[NSForegroundColorAttributeName: UIColor.white])
        textField.backgroundColor = bgColor
        textField.textColor = UIColor.white
        
        return textField
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
        view.addSubview(scrollView)
        scrollView.addSubview(sourceImageView)
        
        view.addSubview(createTextField(CGRect(x: 0, y: 0, width: 100, height: 100), bgColor: UIColor.blue,colorForText: UIColor.white))
        view.addSubview(createTextField(CGRect(x: 150 , y: 0, width: 100, height: 100), bgColor: UIColor.orange,colorForText: UIColor.white))
        view.addSubview(createTextField(CGRect(x: 275, y: 0, width: 100, height: 100), bgColor: UIColor.green,colorForText: UIColor.white))
        
        view.addSubview(createTextField(CGRect(x: 150, y: 275, width: 100, height: 100), bgColor: UIColor.clear,colorForText: UIColor.white))
        
        
        view.addSubview(createTextField(CGRect(x: 150 , y: 567, width: 100, height: 100), bgColor: UIColor.darkGray,colorForText: UIColor.white))
        view.addSubview(createTextField(CGRect(x: 0, y: 567, width: 100, height: 100), bgColor: UIColor.red,colorForText: UIColor.white))
        view.addSubview(createTextField(CGRect(x: 275, y: 567, width: 100, height: 100), bgColor: UIColor.yellow,colorForText: UIColor.white))
        // Do any additional setup after loading the view, typically from a nib.
    }
}

