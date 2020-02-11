// Created on 2/10/20.
// Copyright (c) 2020 ABC Virtual Communications, Inc. All rights reserved.

import UIKit

protocol CitiesViewControllerDelegate: class {
  
  func didSelectCity(_ city: CityModel)
  
}

class CitiesViewController: UITableViewController {
  
  weak var delegate: CitiesViewControllerDelegate?
  
  var selectedCity: CityModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    self.title = RS_LOCATIONS
    self.view.accessibilityIdentifier = AppTest.instance.citiesView
  }
  
  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return CITIES.count
  }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return RS_CITY
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let city = CITIES[indexPath.row]
    let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
    cell.textLabel?.text = city.name
    cell.accessoryType = .none
    if let selectedCity = self.selectedCity {
      if city.id == selectedCity.id {
          cell.accessoryType = .checkmark
      }
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let delegate = self.delegate {
      delegate.didSelectCity(CITIES[indexPath.row])
    }
    self.navigationController?.popViewController(animated: true)
  }
  
}
