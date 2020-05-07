//
//  CoffeeListDetailTableViewController.swift
//  finalProject2
//
//  Created by Lily Copeland on 5/6/20.
//  Copyright © 2020 Lily Copeland. All rights reserved.
//

import UIKit

class CoffeeListDetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var coffeeShopText: UITextField!
    @IBOutlet weak var noteView: UITextView!
    
    var coffeeListItem: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if coffeeListItem == nil {
            coffeeListItem = ""
        }
        
        
        
        coffeeShopText.text = coffeeListItem

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        coffeeListItem = coffeeShopText.text
    }

    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        }
        else {
            navigationController?.popViewController(animated: true)
        }
    }


}
