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
    
    private var data = [[SettingCellModel]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModels()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        
        
    }
    
    
    
    private func configureModels(){
        let section = [
            
            SettingCellModel(title: "Logout", handler: {
                self.didTapLogout()
            })
        ]
        data.append(section)
    }
    
    
    private func didTapLogout(){
        
        let actionSheet = UIAlertController(title: "Logout", message: "Are you sure you want to logout", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Logout", style: .destructive, handler: { _ in
            
            AuthManager.shared.logout { success in
                DispatchQueue.main.async {
                    if success{
                        // Show login
                        let loginVC = LoginViewController()
                        loginVC.modalPresentationStyle = .fullScreen
                        self.present(loginVC, animated: true) {
                            self.navigationController?.popToRootViewController(animated: false)
                            self.tabBarController?.selectedIndex = 0
                        }
                    }else{
                        
                        
                    }
                }
            }
            
            
            
            
        }))
        
        
        
        
        
    }
    
    
}




extension SettingsViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.section][indexPath.row].title
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // handle cell selection
        let model = data[indexPath.section][indexPath.row].handler()
        
        
        
    }
    
}
