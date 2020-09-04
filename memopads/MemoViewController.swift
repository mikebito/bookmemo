//
//  MemoViewController.swift
//  memopads
//
//  Created by 中原幹人 on 2020/07/10.
//  Copyright © 2020 Mikito Nakahara. All rights reserved.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titletextfield : UITextField!
    @IBOutlet var contentextview: UITextView!
    
    var titlestring = [String]()
    var contentstring = [String]()
    var cellnumber: Int!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if saveData.object(forKey: "title") as? [String] != nil {
            titlestring = saveData.object(forKey: "title") as! [String]
            contentstring = saveData.object(forKey: "content") as! [String]
        }
        if cellnumber == nil{
            titletextfield.text = ""
            contentextview.text = ""
        }else{
            titletextfield.text = titlestring[cellnumber]
            contentextview.text = contentstring[cellnumber]
        }

        titletextfield.delegate = self

        // Do any additional setup after loading the view.
    }
    @IBAction func saveMemo(){
        if cellnumber == nil{
            titlestring.append(titletextfield.text!)
            contentstring.append(contentextview.text!)
            print(titlestring)
            saveData.set(titlestring, forKey: "title")
            saveData.set(contentstring, forKey: "content")
            
            let alert : UIAlertController = UIAlertController(title: "保存", message: "メモの保存完了！", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
                print("OK button had push")
            }))
            present(alert, animated: true, completion: nil)
        }else{
            titlestring[cellnumber] = titletextfield.text!
            contentstring[cellnumber] = contentextview.text!
            print(titlestring)
            saveData.set(titlestring, forKey: "title")
            saveData.set(contentstring, forKey: "content")
            
            let alert : UIAlertController = UIAlertController(title: "保存", message: "メモの保存完了！", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                self.navigationController?.popViewController(animated: true)
                print("OK button had push")
            }))
            present(alert, animated: true, completion: nil)
        }
            
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
