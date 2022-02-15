//
//  HomeTableViewController.swift
//  Danamon-App
//
//  Created by Ricky Gideon Iskandar Daun on 15/02/22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    
    private var homeViewModel = HomeViewModel()
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        homeViewModel.photo.bind { [weak self] photo in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
         }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return homeViewModel.photo.value.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "photoTVC", for: indexPath) as! HomeTableViewCell
        
        
        cell.titleLabel.text = homeViewModel.photo.value[indexPath.row].title
        cell.idLabel.text = String(homeViewModel.photo.value[indexPath.row].id)
        cell.urlLabel.text = homeViewModel.photo.value[indexPath.row].url
        
        
        DispatchQueue.global().async {

            let url = URL(string: self.homeViewModel.photo.value[indexPath.row].thumbnailUrl )!

                do {
                        let data = try Data(contentsOf: url )
                        
                        DispatchQueue.main.async {
                            cell.photoImageView?.image = UIImage(data: data)
                        }
                } catch {
                    print(error.localizedDescription)
                }
            }
        
        return cell
    }
    
    override open func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == homeViewModel.photo.value.count - 3 {
            index += 1
            homeViewModel.appendData(index: index)
        }
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

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

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
