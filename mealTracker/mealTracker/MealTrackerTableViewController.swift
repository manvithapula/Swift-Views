//
//  MealTrackerTableViewController.swift
//  mealTracker
//
//  Created by admin64 on 01/10/24.
//

import UIKit

class MealTrackerTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 60))
        tableView.tableFooterView?.backgroundColor = .black
        
        let mealsLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 40))
        mealsLabel.text = "No of meals : \(meals.count)"
        mealsLabel.textColor = .white
        tableView.tableFooterView?.addSubview(mealsLabel)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return meals.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let meal = meals[section]
        return meal.count
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0: return meals[0].foods.count
        case 1: return meals[1].foods.count
        case 2: return meals[2].foods.count
        default: return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Food", for: indexPath)
        let meal = meals[indexPath.section]
        let food = meal.foods[indexPath.row]
        // Configure the cell...
        cell.textLabel?.text = "\(food.name)"
        cell.textLabel?.text = "\(food.description)"
        
        
        
        var content = cell.defaultContentConfiguration()
        content.image = UIImage(named: "foodpasta.jpg")
        content.text = food.name
        content.secondaryText = food.description
        cell.contentConfiguration = content
        cell.showsReorderControl = true
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return meals[section].name

    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedRow = meals.remove(at: meals[fromIndexPath.section].foods[fromIndexPath.row])
        meals[to.section].foods.insert(movedRow, at: to.row)

    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let meal = meals[indexPath.section]
        let alertController = UIAlertController(title: meal.name, message: meal.foods[indexPath.row].name, preferredStyle: .actionSheet)
        let alertAction = UIAlertAction(title: "OK", style: .destructive)
        alertController.addAction(alertAction)
    present(alertController, animated: true)}
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
