//
//  ViewController.swift
//  TableView
//
//  Created by jose ramirez on 6/1/17.
//  Copyright © 2017 Jose Ramirez. All rights reserved.
//

import UIKit
/* when you declare a class as implementing a UITableviewDataSource you need to provide certain methods here
   -- For now we will provide two methods,
        STEP 1: we need to provide how many list items that are going to be in our table view or ROWS.
        STEP 2: Define what is goin to be inside those Rows
      NOTE: Rows are the individual list items
            Sections are Groups of Rows

1.) Getting tableView data into table view that repeats for each row for specied section
2.) Getting tableView Data from an Array
 
*/
class ViewController: UIViewController, UITableViewDataSource {
     //2.) Declaring the array
    let data:[String] = ["Item 1","Item 2","Item 3"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

        /*Step 1: defining number of rows in table*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     /* 1.)
        return 5  // this sais that there are going to be 5 rows in the table view, but we still need to define what is goin to be in those 5 rows.
     */
        
     /* 2.) Modify the number of rows based on the array declared, in this case we are going to return the count of the array data[] 
     */
        return data.count  // this will return the count of the array,
   
    }
    
       /*Step 2: define what is goin to be in those rows in step1 , 
           table view cells are the visual end of a tableview ie: icons , 
           and list, or switches, or custom UI objects etc.*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // so we want to return a UITableView Cell
        let cell = UITableViewCell()
      
     /* 1.) Same data repeated
        /*modifiy the label inside the cell
        --note this will provide this equal to number of rows in section, 
         hense this will show 5 times because the number of rows for this section
         is going to be 5 of the same labels*/
        cell.textLabel?.text = "It's a CELL!"
        return cell
     */
        
     /* 2.)And then when we're providing the cells we need to change the string to be whatever is
         inside of that particular object in the array. So, index zero for the first cell and 
         then one for the second and two for the third. Now to get that data, it's actually stored 
         inside this index path. If you put your cursor on index path and look at the quick health menu, 
         and it says it represents the path to a specific note in a tree of nested array collections.
     */
        //basically it will allow to get to a specific Row and section in our table View
        cell.textLabel?.text = data[indexPath.row]   //note: if you are using sections in table view then you need to make sure you are referencing the right section in your idextpath , but if you just have just one section indexPath.row is sufficient.
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

