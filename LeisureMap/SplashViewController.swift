//
//  SplashViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController,AsyncResponseDelegate {
    
    
    
    
    
    var requestWorker:AsyncRequestWorker?
    var appVersion:String=""
    
    @IBOutlet weak var lbVersion: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        appVersion="" + (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String)!
        lbVersion.text=appVersion
       
        requestWorker=AsyncRequestWorker()
        requestWorker?.responseDelegate=self
        
   
        let from="https://score.azurewebsites.net/api/version/1\( String (describing:appVersion ))"
        
        self .requestWorker?.getResponse(from: from, tag: 1)
        

    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    //MARK:AsyncResponseDelegate
    
    func receivedResponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        
        print(responseString)
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "moveToLoginViewSegue", sender: self)
        }
    }
}
    


