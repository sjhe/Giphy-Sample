//
//  SecondViewController.swift
//  Giphy-Sample
//
//  Created by John He on 2018-03-31.
//  Copyright © 2018 sjhe. All rights reserved.
//

import UIKit
import CoreData
import GiphyCoreSDK

class SecondViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableViiew: UITableView!
    
    var gifs = [String]()
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.gifs.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_second", for: indexPath) as!SecondViewTableViewCellVC
        
        let url = gifs[indexPath.row]
        cell.setUrl(url: url)
        
        cell.backgroundColor = UIColor.white

        return cell
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //loading core data
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Giphy")
        
        request.returnsObjectsAsFaults = false
        
        do
        {
            let results = try managedContext.fetch(request)
            
            if (results.count > 0) {
                for result in results as! [NSManagedObject]{
                    
                    if let url = result.value(forKey: "url") as? String {
                        //display user name
                        print(url)
                        self.gifs.insert(url, at:0)
                    }
                }
                self.tableViiew.reloadData()
            }
            
        }
        catch
        {
            
        }
        
        
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

