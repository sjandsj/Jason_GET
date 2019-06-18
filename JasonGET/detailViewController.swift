//
//  detailViewController.swift
//  JasonGET
//
//  Created by mac on 18/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class detailViewController: UIViewController {

    @IBOutlet weak var detailCountry: UILabel!
    @IBOutlet weak var detailCapital: UILabel!
    @IBOutlet weak var detailPopulation: UILabel!
    @IBOutlet weak var detailRegion: UILabel!
    @IBOutlet weak var detailSubRegion: UILabel!
    @IBOutlet weak var detailNativeName: UILabel!
    
    var stringCountry: String!
    var stringCapital: String!
    var stringRegion: String!
    var stringSubRegion: String!
    var stringPopulation: String!
    var stringNativeName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailCountry.text = stringCountry
        detailCapital.text = stringCapital
        detailRegion.text = stringRegion
        detailSubRegion.text = stringSubRegion
        detailNativeName.text = stringNativeName
        detailPopulation.text = stringPopulation
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
