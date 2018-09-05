//
//  ViewController.swift
//  RSCustomBrowser
//
//  Created by iOS Developer on 05/09/18.
//  Copyright © 2018 iOS Developer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let newsVw = Bundle.main.loadNibNamed("BrowserView", owner: self, options: nil)
        let newsListView = newsVw?.first as! BrowserView
        var artImg = UIImage()

        artImg = UIImage(named:"backIcon")!

        newsListView.postIDIs = 110912      //sharing a post, with ID
        newsListView.artCont = "This is the content of article"      //Article Content
        newsListView.artImg = artImg                                 //Article Image
        newsListView.urlOrganiser = "https://www.webfx.com/web-design/hex-to-rgb/"                               //URL
        newsListView.triggeredFromBroker = 1                         //To identify the source
        newsListView.copiedLink = "https://www.webfx.com/web-design/hex-to-rgb/"                                 //URL copied
        newsListView.frame = CGRect(x:screenValue.bounds.origin.x, y:screenValue.bounds.origin.y, width:(self.view.frame.size.width), height:(self.view.frame.size.height))
        self.view?.addSubview(newsListView)

            let urlIlk = URL (string: "https://www.webfx.com/web-design/hex-to-rgb/")
            newsListView.customWebView.loadRequest(URLRequest(url: urlIlk!))
            newsListView.urlField.text = "https://www.webfx.com/web-design/hex-to-rgb/"


        
        
//        let u = LoaderView()
//
//        let overallVal = 6
//        for i in 1...overallVal{
//            let spaceVal = overallVal - i
//            let spaceCount = (String(repeating:" ", count: spaceVal))
//            print(spaceCount,String(repeating: "*", count: i)) // => '**'
//
//        }
        
        
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

