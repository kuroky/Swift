//
//  ViewController.swift
//  TableViewWithPropertyList
//
//  Created by Carlos Butron on 02/12/14.
//  Copyright (c) 2014 Carlos Butron.
//

import UIKit

class ViewController: UIViewController {
    
    var dicData : NSDictionary? // Global Variable
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupTableView()
    }
    
    func setupData() {
        let path = Bundle.main.bundlePath
        let plistName:NSString = "Property List.plist"
        let finalPath:NSString = (path as NSString).appendingPathComponent(plistName as String) as NSString
        dicData = NSDictionary(contentsOfFile:finalPath as String)
    }
    
    func setupTableView() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dicData!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell {
        
        let cell: CustomCell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let myCell: AnyObject = dicData!.object(forKey: "cell\((indexPath as NSIndexPath).row)") as! NSDictionary
        
        cell.myTitle?.text = myCell.object(forKey: "title") as? String
        cell.mySubtitle?.text = myCell.object(forKey: "subtitle") as? String
        cell.myImage?.image = UIImage(named: myCell.object(forKey: "image") as! String)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section:Int) -> String?  {
        return "TuxMania"
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section:Int) -> String? {
        return "Get all the Tux"
    }
}
