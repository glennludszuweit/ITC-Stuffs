//
//  WebViewController.swift
//  Storyboard
//
//  Created by Glenn Ludszuweit on 06/04/2023.
//

import UIKit
import WebKit

class WebViewController: UIViewController {
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage()
        // Do any additional setup after loading the view.
    }
    
    func loadWebPage() {
        guard let URL = URL(string: "https://developer.apple.com/") else { return }
        let urlReq = URLRequest(url: URL)
        webView.load(urlReq)
    }
}
