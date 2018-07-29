//
//  WebViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/29.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController,WKUIDelegate,WKNavigationDelegate,WKScriptMessageHandler {
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
       
    }
    
    
    

    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let url = URL(string: "htttps://apple.com")
//        let request=URLRequest(url: url!)
//        webView.load(request)
        let contentController = WKUserContentController()
        
        var jScript :String="var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);msg();"
        
        let userScript=WKUserScript(source:jScript  , injectionTime: WKUserScriptInjectionTime.atDocumentEnd, forMainFrameOnly: true)
        
        contentController.addUserScript(userScript)
        contentController.add(self,name:"callbackHandler")
        
        let preferences=WKPreferences()
        preferences.javaScriptEnabled=true
        
        let configration = WKWebViewConfiguration()
        configration.preferences=preferences
        configration.userContentController=contentController
        
        webView=WKWebView(frame: view.bounds, configuration: configration)
        self.view.addSubview(webView)
        
        
        
        let html:String="<html><body><button onclick='query()'>Prompt</button><br /><button type='button' onclick='msg()' text='Hi'>Just Alert Hi</button><br /><button type='button' onclick='callNativeApp()' text='Send Message To Native App'>Send Message To Native App</button><p id='demo'></p><script>function query() { var os = prompt('你現在用什麼作業系統', 'iOS'); if (os != null) { document.getElementById('demo').innerHTML = os + ' is best operation syste, in the world';return os;}}function getelement(){return 'value from javascript function';}function msg(){alert('Hi !');}function callNativeApp(){webkit.messageHandlers.callbackHandler.postMessage('call native from javascript');}</script></body></html>"
        
        webView.loadHTMLString(html, baseURL: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
