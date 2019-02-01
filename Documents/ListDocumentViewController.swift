//
//  ListDocumentViewController.swift
//  Documents
//
//  Created by Madison Williams on 1/30/19.
//  Copyright © 2019 Madison Williams. All rights reserved.
//

import UIKit

class ListDocumentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var documentTable: UITableView!
    
    var documents = [Document]()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Documents"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectedDocument" {
            if let destination = segue.destination as? SingleDocumentViewController,
                let row = documentTable.indexPathForSelectedRow?.row {
                destination.document = documents[row]
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return documents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "documentCell", for: indexPath)
        
        if let cell = cell as? DocumentsTableViewCell {
            let currDocument = documents[indexPath.row]
            cell.sizeLabel.text = String(currDocument.size) + " bytes"
            cell.nameLabel.text = currDocument.name
            cell.lastModifiedLabel.text = dateFormatter.string(from: currDocument.lastModified)
        }
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }



}
