//
//  ViewController.swift
//  JasonGET
//
//  Created by mac on 17/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

struct jsonData: Decodable {
    let name: String
    let capital: String
    let region: String
    let subregion: String
    let population: Int
    let nativeName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayOfData = [jsonData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    func getData() {
        let url = URL(string: "https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do  { if error == nil {
                self.arrayOfData = try JSONDecoder().decode([jsonData].self, from: data!)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                }
            } catch {
                print("Error in getting Data from Json")
            }
        }.resume()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayOfData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.countryLabel.text = "Country: \(arrayOfData[indexPath.row].name)"
        cell.capitalLabel.text = "Capital: \(arrayOfData[indexPath.row].capital)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondScreen: detailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail") as! detailViewController
        secondScreen.stringCountry = "Country : \(arrayOfData[indexPath.row].name)"
        secondScreen.stringCapital = "Capital :\(arrayOfData[indexPath.row].capital)"
        secondScreen.stringRegion = "Region : \(arrayOfData[indexPath.row].region)"
        secondScreen.stringSubRegion = "Sub-Region : \(arrayOfData[indexPath.row].subregion)"
        secondScreen.stringPopulation = "Population : \(arrayOfData[indexPath.row].population)"
        secondScreen.stringNativeName = "Native Name : \(arrayOfData[indexPath.row].nativeName)"
        self.navigationController?.pushViewController(secondScreen, animated: true)
    }
}

















