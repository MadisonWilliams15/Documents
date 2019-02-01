//
//  SingleDocumentViewController.swift
//  Documents
//
//  Created by Madison Williams on 1/30/19.
//  Copyright © 2019 Madison Williams. All rights reserved.
//

import UIKit

class SingleDocumentViewController: UIViewController {

    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var textLabel: UITextView!
    
    var document : Document?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard nameLabel.text != nil else {
            return
        }
        Documents.save(name: nameLabel.text ?? " ", content: textLabel.text)
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nameChanged(_ sender: Any) {
        guard nameLabel.text != nil else {
            return
        }
    }


}
