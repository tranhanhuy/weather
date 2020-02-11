// Created on 2/10/20.
// Copyright (c) 2020 Huy Tran, Inc. All rights reserved.

import UIKit

protocol CitiesViewControllerDelegate: class {
  
  func didSelectCities(_ cities: [CityModel])
  
}

class CitiesViewController: UITableViewController {
  
  weak var delegate: CitiesViewControllerDelegate?
  
  var selectedCities: [CityModel]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = RS_LOCATIONS
    self.view.accessibilityIdentifier = AppTest.instance.citiesView
    self.customNavigationbar()
  }
  
  //MARK: - Navigation Bar
  private func customNavigationbar() {
    self.navigationController?.setNavigationBarHidden(false, animated: false)
    self.navigationItem.hidesBackButton = true
    let newBackButton = UIBarButtonItem(title: RS_BACK, style: .plain, target: self, action: #selector(self.backButtonTouched(_:)))
    newBackButton.accessibilityIdentifier = AppTest.instance.backButton
    self.navigationItem.leftBarButtonItem = newBackButton
  }
  
  //MARK: - Button touched
  @objc private func backButtonTouched(_ sender: Any) {
    self.navigationController?.popViewController(animated: true)
    if let delegate = self.delegate {
      delegate.didSelectCities(self.selectedCities ?? [])
    }
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
    if let selectedCities = self.selectedCities {
      if selectedCities.first(where: { city.id == $0.id }) != nil {
        cell.accessoryType = .checkmark
      }
    }
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let city = CITIES[indexPath.row]
    if self.selectedCities == nil {
      self.selectedCities = [city]
    } else {
      if self.selectedCities?.first(where: { city.id == $0.id }) != nil {
        self.selectedCities?.removeAll(where: { city.id == $0.id })
      } else {
        self.selectedCities?.append(city)
      }
    }
    self.tableView.reloadRows(at: [indexPath], with: .automatic)
  }
  
}
