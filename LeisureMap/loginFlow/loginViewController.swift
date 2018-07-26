//
//  loginViewController.swift
//  LeisureMap
//
//  Created by stu1 on 2018/7/23.
//  Copyright © 2018年 anshangyuan. All rights reserved.
//

import UIKit


class loginViewController: UIViewController,UITextFieldDelegate,AsyncResponseDelegate {
    
    

    @IBOutlet weak var txtAccount: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    var requestWorker:AsyncRequestWorker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestWorker=AsyncRequestWorker()
        requestWorker?.responseDelegate=self
        
        print("viewDidLoad")
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        
        
        let account=txtAccount.text!
        let password=txtPassword.text!
        
        let from="https://score.azurewebsites.net/api/login/\( account)/\(password ))"
        self.requestWorker?.getResponse(from: from, tag: 1)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        
        let accept="abcdeABCDE"
        let cs=NSCharacterSet(charactersIn: accept).inverted
        let filtered=string.components(separatedBy: cs).joined(separator:"")
        
        if(string != filtered){
            return false
        }
        
        var maxLength:Int=0
        if textField.tag==1{
            maxLength=4
        }
        if textField.tag==4{
            maxLength=5
        }
        let countString:NSString=textField.text! as NSString
        
        let newString:NSString=countString.replacingCharacters(in: range, with: string) as NSString
        
        return newString.length <= maxLength
        
    }
   
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("viewDidDisappear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("viewWillDisappear")
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag==1{
            textField.resignFirstResponder()
            txtPassword.becomeFirstResponder()
        }
        if textField.tag==4{
            textField.resignFirstResponder()
        }
        return true
    }
    func receivedResponse(_ sender: AsyncRequestWorker, responseString: String, tag: Int) {
        print(responseString)
    }

//        @IBAction func btnClick(_ sender: Any) {
//
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    }

