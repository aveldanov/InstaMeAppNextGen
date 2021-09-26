//
//  PostViewController.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import UIKit

/*
 Section
 - Header model
 Section
 - Post Cell model
 Section
 - Action Buttons Cel model
 Section
 - n Number of General Model for comments
 
 */

enum PostRenderType{
    case header
    case primaryContent //post
    case actions
    case comments
    
}



struct PostRenderViewModel{
    let renderType: PostRenderType
    
}

class PostViewController: UIViewController {

    private let model: UserPost?
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        tableView.register(IGFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: IGFeedPostHeaderTableViewCell.identifier)
        tableView.register(IGFeedPostActionsTableViewCell.self, forCellReuseIdentifier: IGFeedPostActionsTableViewCell.identifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.identifier)

        return tableView
    }()
    
     //MARK: Init
    
    init(model: UserPost?) {
        self.model = model
        super.init(nibName: nil, bundle: nil)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
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


extension PostViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
