//
//  ViewController.swift
//  Book Love
//
//  Created by MacAir23 on 1/9/19.
//  Copyright © 2019 Matthew Phraxayavong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var networkManager = NetworkManager()
    var quote: Quote!
    
    @IBOutlet weak var quoteText: UILabel!
    
    @IBOutlet weak var quoteAuthor: UILabel!
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var bookImageView: UIImageView!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        networkManager.getRandomQuote{ quote in
            self.quote = quote
            print(quote)
            DispatchQueue.main.async {
                self.quoteText.text = quote.quotetext
                self.quoteAuthor.text = quote.quoteauthor
             
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector(onDidReceiveData(_:)), name: .didReceiveData, object: nil)
//
//        @objc func onDidReceiveData(_ notification:Notification) {
//            // Do something now
//        }
//
        var myActivityIndicator = UIActivityIndicatorView(style:UIActivityIndicatorView.Style.gray)
        myActivityIndicator.center = view.center
        myActivityIndicator.startAnimating()
//        var barButtonItem = UIBarButtonItem(customView: view)
//        self.navigationItem.rightBarButtonItem = barButtonItem
        

        

//
//        @objc func shake() {
//            let shake = CABasicAnimation(keyPath: "Position")
//            shake.duration = 0.1
//            shake.repeatCount = 2
//            shake.autoreverses = true
//
        
//            let fromPoint = CGPoint(x: refreshButton.center.x - 8, y: refreshButton.center.y)
//            let fromValue = NSValue(cgPoint: fromPoint)
        
    

}
}
