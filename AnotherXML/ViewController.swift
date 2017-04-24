//
//  ViewController.swift
//  AnotherXML
//
//  Created by Asif Ikbal on 4/23/17.
//  Copyright © 2017 Asif Ikbal. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var cdArray:[CD] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let pathToFile = Bundle.main.url(forResource: "cd_catalog", withExtension: "xml")
        
        do {
            let parser = try CDParser(data: Data(contentsOf: pathToFile!))
            cdArray = parser.passData()
        } catch {
            print(error)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cdArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CDTableViewCell
           
            let cdObj = cdArray[indexPath.row]
            
            cell.titleLabel.text = cdObj.title
            cell.artistLabel.text = cdObj.artist
        cell.companyLabel.text = cdObj.company
        cell.countryLabel.text = cdObj.country
        cell.priceLabel.text = String(cdObj.price)
        cell.yearLabel.text = String(cdObj.year)
            
            
            return cell
        }
    }




