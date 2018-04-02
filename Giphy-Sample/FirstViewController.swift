//
//  FirstViewController.swift
//  Giphy-Sample
//
//  Created by John He on 2018-03-31.
//  Copyright © 2018 sjhe. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Alamofire
import SwiftyJSON
import GiphyCoreSDK
import CoreData


class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableViewModel = TableViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchText: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
    }
    
    
    var gifs = [GPHMedia]()
    
    var client = GPHClient(apiKey: "jIrEVGxYB4cKk1qSzAsmnQ2vmZ09xH6B")
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return self.gifs.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCellViewController
        
        let media = gifs[indexPath.row]
        cell.setMedia(media: media)
        
        cell.delegate = self
        
        cell.backgroundColor = UIColor.yellow
        //        cell.imagePlaceHolder.image = UIImage.gif(url: url);
        //        cell.favouriteButton.setTitle("Save", for:.normal)
        //        
        
        

        
//        let url = media.images!.fixedHeight!.gifUrl!
//        print(url)
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
        
    }
    
    func gifSeach(_client: GPHClient, query: String) {
        let op = _client.search("cats") { (response, error) in
            if let error = error as NSError? {
                // Do what you want with the error
                print("Error")
            }
            
            if let response = response, let data = response.data, let pagination = response.pagination {
                print(response.meta)
                print(pagination)
                for result in data {
                    print(result)
                    self.gifs.insert(result, at:0)
                }
                self.tableView.reloadData()
            } else {
                print("No Results Found")
            }
        }
        self.tableView.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        client = GPHClient(apiKey: "jIrEVGxYB4cKk1qSzAsmnQ2vmZ09xH6B")
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            
            self.gifSeach(_client: self.client, query: "cat")
            DispatchQueue.main.async {
                print("This is run on the main queue, after the previous code in outer block")
                self.tableView.reloadData()

            }
        }
       
//        makeRequest()
        // Do any additional setup after loading the view, typically from a nib.
        _ = searchText.rx.text.map { $0 ?? ""}.bindTo(tableViewModel.searchText)
        _ = tableViewModel.isValid.bindTo(searchButton.rx.isEnabled)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func saveGifUrl(url: String) {
        let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let newGiphy = NSEntityDescription.insertNewObject(forEntityName: "Giphy", into: managedContext)
        
        newGiphy.setValue(url, forKey: "url")
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
    
}

extension FirstViewController: GiphyTableViewDelegate {
    func didTapSaveButton(url: String) {
        print(url)
        saveGifUrl(url: url)
    }
    
    func didTapUnSaveButton(url: String) {
        
    }
}

