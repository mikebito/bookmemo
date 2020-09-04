//
//  ViewController.swift
//  memopads
//
//  Created by 中原幹人 on 2020/07/10.
//  Copyright © 2020 Mikito Nakahara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table : UITableView!
    
    var saveData: UserDefaults = UserDefaults.standard
    
    var viewtitle = [String]()
    
    var cellnumber : Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.dataSource = self
        table.delegate = self
        
        if saveData.object(forKey: "title") as? [String] != nil {
            viewtitle = saveData.object(forKey: "title") as! [String]
        }
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        print("pass")
        if saveData.object(forKey: "title") as? [String] != nil {
            viewtitle = saveData.object(forKey: "title") as! [String]
        }
        cellnumber = nil
        table.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewtitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = viewtitle[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(viewtitle[indexPath.row])が選ばれました")
        cellnumber = indexPath.row
        performSegue(withIdentifier: "toMemo", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! MemoViewController
        vc.cellnumber = self.cellnumber
    }
    
}

