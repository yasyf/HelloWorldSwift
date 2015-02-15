//
//  ViewController.swift
//  HelloWorld
//
//  Created by Yasyf Mohamedali on 2015-02-14.
//  Copyright (c) 2015 Yasyf Mohamedali. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloWorldLabel: UILabel!
    @IBOutlet weak var switchTextButton: UIButton!
    
    var isHello = true
    let course = "21W.789"
    let imageURL = "https://fbcdn-dragon-a.akamaihd.net/hphotos-ak-xpa1/t39.1997-6/p240x240/851582_369239386556143_1497813874_n.png"
    
    func setImage(var image: UIImage?) {
        if image == nil {
            let url = NSURL(string: imageURL)
            let data = NSData(contentsOfURL: url!)
            image = UIImage(data: data!)
        }
        switchTextButton.setImage(image, forState: UIControlState.Normal)
        switchTextButton.setTitle("", forState: UIControlState.Normal)
    }
    
    func setImage() {
        setImage(nil)
    }
    
    @IBAction func switchText(sender: UIButton) {
        isHello = !isHello
        var transforms: [CGAffineTransform] = []
        var offsets: (x: CGFloat, y: CGFloat) = (0, 0)
        if isHello {
            transforms.append(CGAffineTransformMakeScale(1, 1))
           helloWorldLabel.text = "Hello, \(course)"
        } else {
            transforms.append(CGAffineTransformMakeScale(1, -1))
            let image = sender.imageView?.image?
            offsets.y = -image!.size.height / 2 + 25
            helloWorldLabel.text = "Goodbye, \(course)"
        }
        sender.imageView?.transform = transforms.reduce(CGAffineTransformIdentity) { CGAffineTransformConcat($0, $1) }
        sender.imageEdgeInsets = UIEdgeInsetsMake(-offsets.y, -offsets.x, offsets.y, offsets.x)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

