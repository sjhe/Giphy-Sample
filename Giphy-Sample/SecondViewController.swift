//
//  SecondViewController.swift
//  Giphy-Sample
//
//  Created by John He on 2018-03-31.
//  Copyright © 2018 sjhe. All rights reserved.
//

import UIKit
import CoreData

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Storing core data
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newGiphy = NSEntityDescription.insertNewObject(forEntityName: "Giphy", into: managedContext)
        
        newGiphy.setValue("https://media3.giphy.com/media/12msOFU8oL1eww/200.gif", forKey: "url")
        newGiphy.setValue("350", forKey: "width")
        newGiphy.setValue("200", forKey: "height")
        
        
        do
        {
            try managedContext.save()
            print ("Saved")
        }
        catch
        {
            //Process error
            print("error")
        }

        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

