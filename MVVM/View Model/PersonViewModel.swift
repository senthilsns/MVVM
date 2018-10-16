//
//  PersonViewModel.swift
//  MVVM
//
//  Created by SENTHIL on 16/10/18.
//  Copyright © 2018 Personal. All rights reserved.
//

import UIKit

class PersonViewModel {

    // Closure use for Notification
    var reloadList = {() -> () in }
    var errorMessage = {(message : String) -> () in }
    
    // Array of WikiList Model class
    var arrayOfList : [personModel] = []{
        // Reload data when data set
        didSet{
            reloadList()
        }
    }
    

    //MARK: Read Json
    func readJsonFileFromSandbox(){
        
        if let filePath = Bundle.main.path(forResource: "Info", ofType: "json"), let data = NSData(contentsOfFile: filePath) {
            
            do {
                let decoder = JSONDecoder()
                self.arrayOfList = try decoder.decode([personModel].self, from: data as Data)
            }catch {
                //Handle error
            }
        }
    }

}
