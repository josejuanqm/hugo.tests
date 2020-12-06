//
//  ListViewController.swift
//  CRUD
//
//  Created by Jose Quintero on 12/5/20.
//

import UIKit

class ListViewController: UITableViewController {

    let searchController = UISearchController(searchResultsController: nil)
    let searchBar: UISearchBar = .init()
    let dataSource: PeopleDataSource = .init()
    var filteredData: [Person] = []
    var data: [Person] {
        if filteredData.count == 0 {
            return dataSource.data
        }
        
        return filteredData
    }
    
    override func viewDidLoad() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search People"
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DetailViewController {
            destination.delegate = self
            destination.person = sender as? Person
        }
    }
    
    func refresh() {
        tableView.reloadData()
    }

}

// MARK: UITableViewDelegate
extension ListViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = data[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = "\(person.lastName), \(person.firstName)"
        
        return cell ?? UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = data[indexPath.row]
        performSegue(withIdentifier: "createShowDetail", sender: person)
    }
    
    @IBAction func create() {
        performSegue(withIdentifier: "createShowDetail", sender: nil)
    }
    
}

// MARK: DetailViewControllerDelegate
extension ListViewController: DetailViewControllerDelegate {
    func create(person: Person) {
        dataSource.add(person: person)
        refresh()
    }
    
    func update(person: Person, with details: Person.Details) {
        dataSource.update(person: person, with: details)
        print(dataSource.data)
        refresh()
    }
    
    func delete(person: Person) {
        dataSource.remove(person: person)
        refresh()
    }
}

// MARK: UISearchResultsUpdating
extension ListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filteredData = dataSource
            .data
            .filter({
                "\($0.firstName) \($0.lastName)"
                    .lowercased()
                    .contains("\(searchBar.text?.lowercased() ?? "")")
            })
        tableView.reloadData()
    }
}
