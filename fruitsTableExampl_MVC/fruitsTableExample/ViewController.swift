//
//  ViewController.swift
//  fruitsTableExample
//
//  Created by user on 9/15/16.
//  Copyright © 2016 ASU. All rights reserved.
//

import UIKit


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //model
    var myFruitList:fruits =  fruits()
    
    @IBOutlet weak var fruitTable: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // calling the model to get the fruit count
        return myFruitList.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fruitCell", for: indexPath) as! FruitTableViewCell
        cell.layer.borderWidth = 1.0
        
        // calling the model to get the fruit object each row
        let fruitItem = myFruitList.getFruitObject(item:indexPath.row)
        
        cell.fruitTitle.text = fruitItem.fruitName;
        //cell.fruitDescription.text = fruitItem.fruitDescription
    
        cell.fruitImage.image = UIImage(named: fruitItem.fruitImageName!)
        
        
        return cell
        
    }
    
    // delete table entry
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell.EditingStyle { return UITableViewCell.EditingStyle.delete }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
      // delete the data from the fruit table,  Do this first, then use method 1 or method 2
        myFruitList.removeFruitObject(item: indexPath.row)
        
        //Method 1
        self.fruitTable.beginUpdates()
        self.fruitTable.deleteRows(at: [indexPath], with: .automatic)
        self.fruitTable.endUpdates()
        
        //Method 2
          //self.fruitTable.reloadData()
        
    }

    // add a new fruit to the fruit table
    @IBAction func refreash(_ sender: AnyObject) {
      
        
        let alert = UIAlertController(title: "Add City", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "Enter Name of the City Here"
        })
        
        alert.addTextField(configurationHandler: { textField in
                   textField.placeholder = "Enter description of the City Here"
               })
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            
            // Do this first, then use method 1 or methodh 2
            let name = alert.textFields![0]
                print("City name: \(name)")
                
                let descp = alert.textFields![1]
            print("descripiton name: \(descp)")
                
               // let f4 = fruit(fn: name, fd: "Healthy", fin: "banana.jpg")
                
            self.myFruitList.addFruitObject(name: name.text!, desc: descp.text!, image: "Phoenix.jpg")
                
                //Method 1
               
                let indexPath = IndexPath (row: self.myFruitList.getCount() - 1, section: 0)
                self.fruitTable.beginUpdates()
                self.fruitTable.insertRows(at: [indexPath], with: .automatic)
                self.fruitTable.endUpdates()
                
               //Method 2
                //self.fruitTable.reloadData()
            
        }))
        
        self.present(alert, animated: true)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let selectedIndex: IndexPath = self.fruitTable.indexPath(for: sender as! UITableViewCell)!
        
        let fruit = myFruitList.getFruitObject(item: selectedIndex.row)
        
        
        
        if(segue.identifier == "detailView"){
            if let viewController: DetailViewController = segue.destination as?
                DetailViewController {
                viewController.selectedFruit = fruit.fruitName;
                viewController.selectedDescrip = fruit.fruitDescription;
                viewController.selectedImage = fruit.fruitImageName;
               // print("about to go to detailed view")
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

