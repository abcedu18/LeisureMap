//
//  NoteViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/25.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController,UIImagePickerControllerDelegate{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
  
    @IBAction func btnPhotoClick(_ sender: Any) {
      
        func camera()
        {
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate ;
                myPickerController.sourceType = .camera
                self.present(myPickerController, animated: true, completion: nil)
            }
            
        }
        
        func photoLibrary()
        {
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                let myPickerController = UIImagePickerController()
                myPickerController.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate ;
                myPickerController.sourceType = .photoLibrary
                self.present(myPickerController, animated: true, completion: nil)
            }
        }
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
