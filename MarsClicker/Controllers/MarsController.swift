//
//  ViewController.swift
//  MarsClicker
//
//  Created by Aidan Blant on 9/3/20.
//  Copyright © 2020 Aidan Blant. All rights reserved.
//

import UIKit


class MarsController: UIViewController {
    
    let colors : [UIColor] = [
        #colorLiteral(red: 0.03137254902, green: 0.4980392157, blue: 0.5490196078, alpha: 1),#colorLiteral(red: 0.1594595218, green: 0.380979079, blue: 0.4119148706, alpha: 1),#colorLiteral(red: 0.2784313725, green: 0.3843137255, blue: 0.3098039216, alpha: 1),#colorLiteral(red: 0.1921568627, green: 0.3082466424, blue: 0.8695040345, alpha: 1),#colorLiteral(red: 0.01023314334, green: 0, blue: 0.6671380997, alpha: 1),#colorLiteral(red: 0.08909042925, green: 0.2101066709, blue: 0.228934139, alpha: 1)
    ]

    @IBOutlet weak var resourcesTable: UITableView!
    
    @IBOutlet weak var ButtonsNavigationController: ButtonsNavigationController!
    @IBOutlet weak var panelSwitcherButtons: UIStackView!
    
    var currentPanel : Int = 0
    
    var isSelectedArray : [Bool] = Array(repeating: false, count: 10)
    var resourceNames : [String] = ["Soil","Ore","Ligma","Metal"]
    var resouceAmounts : [Float] = Array(repeating: 0, count : 10)
    
    var soil : Float {
        get{
            return DataManager.soil
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("MarsController viewDidLoad() Called")
        
        // Register Nib
        resourcesTable.register(UINib(nibName: "ResourceExpandableCell", bundle: nil), forCellReuseIdentifier: "ResourceExpandableCell")
        resourcesTable.delegate = self
        resourcesTable.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Prepare called on segue: \(segue) and sender: \(sender)")
        if let vc = segue.destination as? ButtonsNavigationController,
                    segue.identifier == "EmbedSegue" {
            self.ButtonsNavigationController = vc
        }
    }
    
    @IBAction func goToPressed(_ sender: UIButton){
        switch(sender.tag){
            case 0 :
                ButtonsNavigationController.goToBase()
            case 1 :
                print("GoTo3DPrinter")
                return
            case 2:
                ButtonsNavigationController.goToLab()
            default:
                break;
        }
        // If successful, change button background Color
        panelSwitcherButtons.arrangedSubviews[currentPanel].backgroundColor = colors[5]
        currentPanel = sender.tag
        panelSwitcherButtons.arrangedSubviews[currentPanel].backgroundColor = colors[4]
    }
    
    @IBAction func goToBasePressed(_ sender: UIButton) {
        ButtonsNavigationController.goToBase()
    }
    
    @IBAction func goTo3DPrinter(_ sender: UIButton) {
        print("goTo3DPrinter")
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
        if( indexPath.row == 1 ){
            cell.CurrentAmount.text = "\(resouceAmounts[indexPath.row])/400"
        }
        cell.ResourceName.text = resourceNames[indexPath.row]
        return cell
    }
    
}
