//
//  ViewController.swift
//  finalProject2
//
//  Created by Lily Copeland on 5/6/20.
//  Copyright © 2020 Lily Copeland. All rights reserved.
//

import UIKit

class CoffeeListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    
    var coffeeListArray = ["Indaba", "Revel 77", "Ladder Toast and Coffee", "Vessel"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! CoffeeListDetailTableViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.coffeeListItem = coffeeListArray[selectedIndexPath.row]
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
          let source = segue.source as! CoffeeListDetailTableViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            coffeeListArray[selectedIndexPath.row] = source.coffeeListItem
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        } else {
            let newIndexPath = IndexPath(row: coffeeListArray.count, section: 0)
            coffeeListArray.append(source.coffeeListItem)
            tableView.insertRows(at: [newIndexPath], with: .bottom)
            tableView.scrollToRow(at: newIndexPath, at: .bottom, animated: true)
        }
    }

   
    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
               if tableView.isEditing {
                   tableView.setEditing(false , animated: true)
                              sender.title = "Edit"
                              addBarButton.isEnabled = true
               } else {
                   tableView.setEditing(true, animated: true)
                   sender.title = "Done"
                   addBarButton.isEnabled = false
               }
           }
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print("cellForRowAt was just called for indexPath.row = \(indexPath.row) which is the cell containing \(coffeeListArray[indexPath.row])")
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:  indexPath)
    cell.textLabel?.text = coffeeListArray[indexPath.row]
    return cell
}
}
extension CoffeeListViewController: UITableViewDelegate, UITableViewDataSource{
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print("numberOfRowsInSections was just called. Returning \(coffeeListArray.count)")
    return coffeeListArray.count
    
    }
    func tableView ( _ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == .delete {
            coffeeListArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade
            )
        }
    }
    func tableView( _ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let itemToMove = coffeeListArray[sourceIndexPath.row]
        coffeeListArray.remove(at: sourceIndexPath.row)
        coffeeListArray.insert(itemToMove, at: destinationIndexPath.row)
    } 
    
}

