//
//  BrowserView.swift
//  9ineSports
//
//  Created by iOS Developer on 27/10/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import UIKit

class BrowserView: UIView, UIWebViewDelegate {

    @IBOutlet weak var revealMenuIcon: UIButton!

    @IBOutlet weak var urlField: UITextField!
    @IBOutlet weak var customWebView: UIWebView!
    
    
    var postIDIs = Int()
    var artCont = String()
    var artImg = UIImage()
    var urlOrganiser = String()
    var triggeredFromBroker = Int()
    var copiedLink = String()

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        
        urlField.leftViewMode = UITextFieldViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 3, y: 0, width: 20, height: 20))
        let image = UIImage(named: "lockIconIn")
        imageView.image = image
        urlField.leftView = imageView
        
        customWebView.delegate = self
        
//        var imageView = UIImageView()
//        var image = UIImage(named: "lockIconIn")
//        imageView.image = image
//        urlField.leftView = imageView
//        urlField.leftViewMode = UITextFieldViewMode.always
    }
    func webViewDidStartLoad(_ webView: UIWebView) {
//        CustomActivityIndicator.sharedInstancesvc.showAnimation()    Start animation until content loaded.
        
        
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error)
    {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView)
    {
//        CustomActivityIndicator.sharedInstancesvc.stopAnim()          Stop animation once content is loaded.
        
    }

    @IBAction func revealMenuIcon(_ sender: Any) {
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        let newView = PopOverView.init(frame: revealMenuIcon.frame)
        
        
        newView.postIDIs = postIDIs
        newView.artCont = artCont
        newView.artImg = artImg
        newView.urlOrganiser = urlOrganiser
        newView.triggeredFrom = triggeredFromBroker
        newView.copiedLinkIs = copiedLink
        self.addSubview(newView)
        
    }

    @IBAction func quitWebView(_ sender: Any) {
 
        self.removeFromSuperview()

    }
}
