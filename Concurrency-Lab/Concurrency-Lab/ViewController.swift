//
//  ViewController.swift
//  Concurrency-Lab
//
//  Created by Kary Martinez on 9/3/19.
//  Copyright © 2019 Kary Martinez. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var CountriesTableView: UITableView!
    
    var countriesList = [nameWrapper] () {
        didSet {
            CountriesTableView.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureTableView()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countriesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentCountries = countriesList[indexPath.row]
        let cell = CountriesTableView.dequeueReusableCell(withIdentifier: "countriesListCell")
        cell?.textLabel?.text = currentCountries.name
        return cell!
    }
    
    
    private func configureTableView() {
        CountriesTableView.delegate = self
        CountriesTableView.dataSource = self
    }
    private func loadData () {
        guard let pathToData = Bundle.main.path(forResource: "countryList", ofType: "json") else {
            fatalError("colors.json file not found")
        }
        let internalUrl = URL(fileURLWithPath: pathToData)
        do {
            let data = try Data(contentsOf: internalUrl)
            let countryListFromJSON = try nameWrapper.getCountriesList(from: data)
            countriesList = countryListFromJSON
        }
        catch {
            fatalError("An error occurred: \(error)")
        }
        
    }
    
}






