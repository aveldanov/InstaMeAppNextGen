//
//  NotificationsViewController.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import UIKit

class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tableView
    }()
    
    // instantiate only if there are no notificaitons
    // no point to put it in the viewDidLayoutSubviews as lazy becomes useless
    private lazy var noNotificationsView = NoNotificationsView()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.tintColor = .label
        return spinner
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
//        spinner.startAnimating()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        spinner.frame = CGRect(x: 0,
                               y: 0,
                               width: 100,
                               height: 100)
        spinner.center = view.center
    }
    
    
    private func addNoNotificationsView(){
        tableView.isHidden = true
        view.addSubview(noNotificationsView)
        noNotificationsView.frame = CGRect(x: 0,
                                           y: 0,
                                           width: view.width/2,
                                           height: view.width/4)
        noNotificationsView.center = view.center
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        return cell
    }
    
}
