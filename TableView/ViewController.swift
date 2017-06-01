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
 3.) How to Recycle or Reuse Table Views, in the case that you have a ton of data
 4.) Using a multidimentinal array for organizing the tableView Rows into Sections
 5.) Addint tittles or headers for each section in the group.
 
 */
class ViewController: UIViewController, UITableViewDataSource {
    //2.) Declaring the array
    //  let data:[String] = ["Item 1","Item 2","Item 3"]
    
    // 4.) multimentinal array
    let data:[[String]] = [["Item 1","Item 2","Item 3"],
                           ["Item A","Item B","Item C"]]
    
    //5.) string array for header
    let headers:[String] = ["Numbered","Lettered"]  //a string for each section in the data[]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    /*Step 1: defining number of rows in table*/
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        /* 1.)
         return 5  // this sais that there are going to be 5 rows in the table view, but we still need to define what is goin to be in those 5 rows.
         */
        
        /* 2.)& 3.) Modify the number of rows based on the array declared, in this case we are going to return the count of the array data[]
         
         return data.count  // this will return the count of the array,
         */
        
        /*4.) you need to use number of rows in the current sections. not just the number of sections*/
        return data[section].count  //handle the number of sections in tableView func below
    }
    
    /*4.)this fuction handles the number of sections, that will give TWO because the
     mulidimentinal array has to sections. Item1, items 2, items 3 and items A,itemsB,ItemsC*/
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    
    
    /*Step 2: define what is goin to be in those rows in step1 ,
     table view cells are the visual end of a tableview ie: icons ,
     and list, or switches, or custom UI objects etc.*/
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        /* 1.) Same data repeated
         // so we want to return a UITableView Cell
         let cell = UITableViewCell()
         
         /*modifiy the label inside the cell
         --note this will provide this equal to number of rows in section,
         hense this will show 5 times because the number of rows for this section
         is going to be 5 of the same labels*/
         cell.textLabel?.text = "It's a CELL!"
         return cell
         */
        
        /* 2.)And then when we're providing the cells we need to change the string to be whatever is
         inside of that particular object in the array.
         /*So, index zero for the first cell and
         then one for the second and two for the third. Now to get that data, it's actually stored
         inside this index path. If you put your cursor on index path and look at the quick health menu,
         and it says it represents the path to a specific note in a tree of nested array collections.*/
         // so we want to return a UITableView Cell
         let cell = UITableViewCell()
         
         //basically it will allow to get to a specific Row and section in our table View
         cell.textLabel?.text = data[indexPath.row]   //note: if you are using sections in table view then you need to make sure you are referencing the right section in your idextpath , but if you just have just one section indexPath.row is sufficient.
         return cell
         */
        
        /* 3.)IOS has a built in feature to recycle tableView Rows
         /* so we want to return a UITableView Cell
         --NOTE: what ever you call the string perameter you need to remember because you will use it later
         this method dequeueResuableCell returns a reuable cell, and is great for optimization reasons*/
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = data[indexPath.row]
         return cell
         /*--So let's make the other change that we have to make by going to our storyboard.*/
         
         /*Remember that we have this identifier "cell" here. We'll go to Main.storyboard, and then we're going to select the Table View and head over to the Attributes Inspector. Now the Attributes Inspector has several different settings for your table view, including how the data is organized, colors of cells, etc. So you can modify those here should you choose. To reuse the cells however, we're going to need to add a prototype cell. Make sure that in your Table View section you have Content set to Dynamic Prototypes.
         
         In here you want to add a prototype cell by clicking the up arrow, so now I have this one Prototype Cell right here, and if you click on that cell then you're going to see this area inside of the Attributes Inspector. You should see that you have a Table View Cell selected. For the style, I'm going to leave Custom and for the Identifier, I'm going to type "cell", so this comes from the string that we set earlier in the dequeueResuableCell method, so if we change that "cell" string to something else, then you need to use that something else in your storyboard as well.*/
         */
        
        
        /* 4.) we need to modify table-view cell for row at index path.
         Because now we need the section and the row.*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row]  //this gets section,then the row == the item in each array
        return cell
        
        /*Now go back to storyBoard to choose how the sections are presented, so in the storyboard select the table-view and then under style, in the attributes inspector, I'm going to change from plain to grouped. Now if we do that and we test the application, now the items are broken up into obvious groups, there we go. So we successfully grouped our table-views by handling number of sections in table-view and by using a multidimensional array.
         
         So now if we wanted to add another group, we just add another one of our arrays into this multidimensional array. We can also add additional items or remove items, they don't need to have the same amount. We can put all of our data in here and it will show up in the table-view properly. If you want to customize the appearance of the groups in your table-view, you can always modify the separator, settings, and you can modify the colors, you can do all of this through the attributes inspector.
         
         So by using this multidimensional array, we can make any modifications that we want and the data will show up properly and organized within the table-view.*/
    }
    
    /* 5.) adding headers to the tableView for each of the section of rows, in order to use this
     method though, you have to create a new string array, which i have done above
     */
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]  //this will add the appropriate headers for each section
    }
    
    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

