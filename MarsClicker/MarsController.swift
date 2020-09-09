//
//  ViewController.swift
//  MarsClicker
//
//  Created by Aidan Blant on 9/3/20.
//  Copyright © 2020 Aidan Blant. All rights reserved.
//

import UIKit

class MarsController: UIViewController {

    @IBOutlet weak var resourcesTable: UITableView!
    
    @IBOutlet weak var ButtonsNavigationController: ButtonsNavigationController!
    
    var currentPanel : Int = 0
    
    var isSelectedArray : [Bool] = Array(repeating: false, count: 10)
    var resourceNames : [String] = ["Soil","Ore","Ligma","Metal"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register Nib
        resourcesTable.register(UINib(nibName: "ResourceExpandableCell", bundle: nil), forCellReuseIdentifier: "ResourceExpandableCell")
        resourcesTable.delegate = self
        resourcesTable.dataSource = self
        
//        print( ButtonsContainer.embeddedViewController )
//        initEmbedVC()
    }
    
//    func initEmbedVC(){
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            print("Prepare called on segue: \(segue) and sender: \(sender)")
            if let vc = segue.destination as? ButtonsNavigationController,
                        segue.identifier == "EmbedSegue" {
                self.ButtonsNavigationController = vc
            }
            print(self.ButtonsNavigationController)
        }
  //  }
    
    
    
    @IBAction func goToBasePressed(_ sender: UIButton) {
        ButtonsNavigationController.goToBase()
    }
    
    @IBAction func goTo3DPrinter(_ sender: UIButton) {
        
    }    
    
    @IBAction func goToLabPressed(_ sender: UIButton) {
        ButtonsNavigationController.goToLab()
    }
    
    
}


extension MarsController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        isSelectedArray[indexPath.row] = !isSelectedArray[indexPath.row]
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if( isSelectedArray[indexPath.row] ){
            return 50.0
        }
        return 30.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = resourcesTable.dequeueReusableCell(withIdentifier: "ResourceExpandableCell") as! ResourceExpandableCell
        cell.ResourceName.text = resourceNames[indexPath.row]
        return cell
    }
    
    
    
}
