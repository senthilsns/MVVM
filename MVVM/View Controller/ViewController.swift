//
//  ViewController.swift
//  MVVM
//
//  Created by SENTHIL on 16/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // View model object
    var viewModel = PersonViewModel()
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

  self.navigationController?.isNavigationBarHidden = true
        
        // Create table View
        pageSetup()
    }
    
    //MARK: Initial page settings
    func pageSetup()  {
        // activityIndicator.startAnimating()
        tableViewSetup()
        ///API calling from viewmodel class
        viewModel.readJsonFileFromSandbox()
        closureSetUp()
    }
    
    //MARK: Closure Initialize
    func closureSetUp()  {
        viewModel.reloadList = { [weak self] ()  in
            ///UI chnages in main tread
            DispatchQueue.main.async {
                self?.tableView.isHidden = false
                self?.tableView.reloadData()
            }
        }
        viewModel.errorMessage = { [weak self] (message)  in
            DispatchQueue.main.async {
                print(message)
            }
        }
    }
}

//MARK: ViewController Extension
extension ViewController : UITableViewDelegate,UITableViewDataSource{
    // Table view settings
    func tableViewSetup()  {
        tableView.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.arrayOfList.count
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing : personDetailCell.self)) as! personDetailCell
        
        let listObj = viewModel.arrayOfList[indexPath.row]
        cell.personNameLabel.text = listObj.name
        cell.companyNameLabel.text = listObj.company
     
        // Cell background color change
        if ((indexPath.row % 2) != 0){
            cell.contentView.backgroundColor = UIColor.yellow
        }else{
            cell.contentView.backgroundColor = UIColor.clear
        }
        return cell
    }
}

