//
//  PopOverView.swift
//  CoreDataHelper
//
//  Created by iOS Developer on 27/10/17.
//  Copyright © 2017 iOS Developer. All rights reserved.
//

import UIKit
struct screenValue {
    static let bounds = UIScreen.main.bounds
    static let xVal = bounds.width/2.0
    static let yVal = bounds.height/2.0
    static let widthIsAs = bounds.size.width
    static let HeightIsAs = bounds.size.height
    
}

class PopOverView: UIView, UITableViewDelegate, UITableViewDataSource{
    
    private let myArray: NSArray = ["Share via APP","Share via...","Copy Link","Open this link in Safari"]
    private var myTableView: UITableView!
    var cgRectOfButton = CGRect()

    
    var postIDIs = Int()
    var artCont = String()
    var artImg = UIImage()
    var urlOrganiser = String()
    var triggeredFrom = Int()
    var copiedLinkIs = String()


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    */
    override init(frame: CGRect) {
        cgRectOfButton = frame

        super.init(frame: CGRect(x:0, y:0, width: screenValue.widthIsAs, height: screenValue.HeightIsAs-68))
        //print(frame)
        
        self.backgroundColor = UIColor.clear
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(handleTap))
        self.addGestureRecognizer(tap)
 
        
    }
    @objc func handleTap(sender: UITapGestureRecognizer) {
        let tapLocation = sender.location(in: myTableView)
        
        if let _ = myTableView.indexPathForRow(at: tapLocation) {
            sender.cancelsTouchesInView = false
        }
        else {
            self.removeFromSuperview()
        }
        
    }
    
    override func draw(_ rect: CGRect) {
        //print(rect)
        addTriangle(rect)
        addTableView(rect)

    }

    func addTriangle(_ rect: CGRect){
        //print(cgRectOfButton)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        let getyPos = cgRectOfButton.origin.y + cgRectOfButton.height + 10
        let wVal = cgRectOfButton.origin.x
        let getxPos = wVal + 15
        
        context.beginPath()
        
        context.move(to: CGPoint(x: getxPos, y: getyPos+20))
        context.addLine(to: CGPoint(x: getxPos+30, y: getyPos+20))
        context.addLine(to: CGPoint(x: getxPos+15, y: getyPos))
        context.closePath()
        context.setFillColor(red:0/255, green:0/255, blue:0/255, alpha:0.9)
        context.fillPath()
        
    }
    func addTableView(_ rect: CGRect){
        let getyPos = cgRectOfButton.origin.y + cgRectOfButton.height + 29

        myTableView = UITableView(frame:CGRect(x:rect.maxX - 270, y:getyPos, width:260, height:175))
        myTableView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        myTableView.backgroundColor = UIColor(red:0/255, green:0/255, blue:0/255, alpha:0.9)
        myTableView.dataSource = self
        myTableView.delegate = self
        myTableView.layer.cornerRadius = 6
        myTableView.separatorColor = UIColor.darkGray
        myTableView.separatorStyle = .singleLine
        myTableView.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        myTableView.isScrollEnabled = false
        self.addSubview(myTableView)

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {


        if indexPath.row == 0 {
            internalShare()
        }
        else if indexPath.row == 1{
            //Share as per your need.
            self.share(sender: self, textIs: artCont, myImage: artImg, totalURL: urlOrganiser)

        }
        else if indexPath.row == 2{
            UIPasteboard.general.string = copiedLinkIs
        }
        else if indexPath.row == 3{
            UIApplication.shared.openURL(URL(string: copiedLinkIs)!)
        }
        else {
            //default
        }
        
        
        self.removeFromSuperview()

        
    }
    func share(sender:UIView, textIs: String,myImage: UIImage, totalURL: String){
        UIGraphicsBeginImageContext((sender.superview?.frame.size)!)
        sender.superview?.layer.render(in: UIGraphicsGetCurrentContext()!)
        
        
        UIGraphicsEndImageContext()
        
        // set up activity view controller
        let imageToShares = [ myImage ]
        
        if let myWebsite = URL(string: totalURL) {//Enter link to your app here
            let objectsToShare = [textIs, myWebsite, imageToShares] as [Any]
            let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            
            //Excluded Activities
            //activityVC.excludedActivityTypes = [UIActivityType.airDrop, UIActivityType.addToReadingList]
            //
            
            activityVC.popoverPresentationController?.sourceView = sender
            UIApplication.shared.keyWindow?.rootViewController?.present(activityVC, animated: true, completion: nil)
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
//        cell.backgroundColor = UIColor(red:0/255, green:0/255, blue:0/255, alpha:0.9)
        cell.backgroundColor = UIColor.clear
        let singleValue :String = myArray[indexPath.row] as! String
        
        cell.textLabel!.text = "   \(NSLocalizedString(singleValue, comment: ""))"
        
        cell.textLabel?.font = UIFont(name:"Avenir Book", size:14)

        cell.textLabel?.textColor = UIColor(red:187/255, green:187/255, blue:187/255, alpha:1.0)
        return cell
    }
    func internalShare() {
            //Code to share the contetnt within your own app.
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }

    
}
