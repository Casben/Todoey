//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Herbert Dodge on 9/14/20.
//  Copyright © 2020 Herbert Dodge. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var categories = [Category]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    //MARK: - Configuration
    func configure() {
        loadCategories()
    }
    
    //MARK: - Methods
    
    func save(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("unable to save data with error \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories() {
//        let request: NSFetchRequest<Category> = Category.fetchRequest()
//        
//        do {
//            categories = try context.fetch(request)
//        } catch {
//            print("error fetching data from context \(error)")
//        }
//        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
        
    }
    
    
    //MARK: - Helpers
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            
            
            
            let newCategory = Category()
            newCategory.name = textField.text!
            self.categories.append(newCategory)
            
            self.save(category: newCategory)
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true)
    }
    
    //MARK: - TableView Datasource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categories[indexPath.row]
        
        cell.textLabel?.text = category.name
        
        return cell
    }
    
    
    
    //MARK: - TableView Delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
}
