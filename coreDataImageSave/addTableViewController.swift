//
//  addTableViewController.swift
//  coreDataImageSave
//
//  Created by Manuel Soberanis on 10/06/20.
//  Copyright © 2020 featherSoft. All rights reserved.
//

import UIKit

class addTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var items: [BrowseImage] = []
    @IBOutlet weak var sampleTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        sampleTableView.delegate = self
        sampleTableView.dataSource = self
        // Do any additional setup after loading the view.
        let name = Notification.Name("didTakePic")
        NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: name, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    @objc func fetchData() {
        
        do {
            items = try context.fetch(BrowseImage.fetchRequest())
            print(items)
            DispatchQueue.main.async {
                self.sampleTableView.reloadData()
            }
        } catch {
            print("Couldn't Fetch Data")
        }
        
    }

    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:customTableCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! customTableCell
        let image : UIImage = UIImage(data: items.reversed()[indexPath.row].image!)!
        cell.customcellImage.image = image
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

}
