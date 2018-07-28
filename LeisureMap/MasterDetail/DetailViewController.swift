//
//  DetailViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedStore :Store?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = selectedStore?.Name
    }
    
   
    @IBAction func btnWebClicked(_ sender: Any) {
        DispatchQueue.main .async {
            self.performSegue(withIdentifier: "moveToNoteViewSegue", sender: self)
        }
    }
    
    
    @IBAction func btnMapClicked(_ sender: Any) {
        DispatchQueue.main .async {
            self.performSegue(withIdentifier: "moveToMapViewSegue", sender: self)
      }

    }
       
   
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch segue.identifier {
            
        case "moveToMapViewSegue":
           
            
            break
            
        case "moveToNoteViewSegue":
            
            
            break
        default:
            break
        }
        
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
