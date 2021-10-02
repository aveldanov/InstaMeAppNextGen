//
//  NotificationsViewController.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/23/21.
//

import UIKit



struct UserNotification{
    let type: UserNotificationType
    let text: String
    let user: User
    
}
enum UserNotificationType{
    case like(post: UserPost) // like associated with a post
    case follow(state: FollowState)
}

final class NotificationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.isHidden = false
        tableView.register(NotificationFollowEventTableViewCell.self, forCellReuseIdentifier: NotificationFollowEventTableViewCell.identifier)
        tableView.register(NotificationLikeEventTableViewCell.self, forCellReuseIdentifier: NotificationLikeEventTableViewCell.identifier)
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
    
    
    private var models = [UserNotification]()
    
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Notifications"
        view.backgroundColor = .systemBackground
        view.addSubview(spinner)
        //        spinner.startAnimating()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        fetchNotifications()
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
    
    
    private func fetchNotifications(){
        for i in 0..<100{
            let user = User(username: "@anton",
                            bio: "",
                            name: (first: "Anton", last: "V"),
                            profilePhotoURL: URL(string: "https://www.google.com")!,
                            birthDate: Date(),
                            gender: .other,
                            counts: UserCount(followers: 1, following: 1, posts: 1),
                            joinDate: Date())
            let post = UserPost(postID: "",
                                postType: .photo,
                                thumbNailImageURL: URL(string: "https://www.google.com")!,
                                postURL: URL(string: "https://www.google.com")!,
                                caption: nil,
                                likeCount: [],
                                comments: [],
                                createdDate: Date(),
                                owner: user,
                                taggedUsers: [])
            let model = UserNotification(type: i%2 == 0 ? .like(post: post): .follow(state: .not_following),
                                         text: "Notific",
                                         user: user)
            models.append(model)
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.row]
        switch model.type{
        case .like(_):
            // like cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationLikeEventTableViewCell.identifier, for: indexPath) as! NotificationLikeEventTableViewCell
            cell.delegate = self
            cell.configure(with: model)
            return cell
            
        case .follow:
            // follow cell
            let cell = tableView.dequeueReusableCell(withIdentifier: NotificationFollowEventTableViewCell.identifier, for: indexPath) as! NotificationFollowEventTableViewCell
            cell.delegate = self
//            cell.configure(with: model)
            
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
}


extension NotificationsViewController: NotificationLikeEventTableViewCellDelegate{

    func didTapRelatedPostButton(model: UserNotification) {
        print("Tapped post")
        
        // Open post
        
        switch model.type{
        case .like(let post):
            let vc = PostViewController(model: post)
            vc.title = post.postType.rawValue
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
        case .follow(_):
            fatalError("Dev Issue: Should never get called")
        }
    }
}

extension NotificationsViewController: NotificationFollowEventTableViewCellDelegate{
    func didTapFollowUnfollowButton(model: UserNotification) {
        print("Tapped follow/unfollow button")
        
        // update DB
    }
    

  

}
