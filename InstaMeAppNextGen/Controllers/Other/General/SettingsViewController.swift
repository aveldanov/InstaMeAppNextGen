//
//  SettingsViewController.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import UIKit



///View Controller to show user settings

struct SettingCellModel{
    
    let title: String
    let handler: ()->Void
}



class SettingsViewController: UIViewController {

    private let tableView: UITableView = {
        let table = UITableView(frame: .zero,
                                style: .grouped)
        
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        
    }

}


extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel = ""
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // handle cell selection
        
        
    }
    
}
