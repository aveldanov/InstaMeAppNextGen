//
//  ViewController.swift
//  InstaMeAppNextGen
//
//  Created by Anton Veldanov on 8/22/21.
//
import Firebase
import UIKit


struct HomeFeedRenderViewModel{
    let header: PostRenderViewModel
    let post: PostRenderViewModel
    let actions: PostRenderViewModel
    let comments: PostRenderViewModel
}

class HomeViewController: UIViewController {

    private var feedRenderModels = [HomeFeedRenderViewModel]()

    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(IGFeedPostHeaderTableViewCell.self, forCellReuseIdentifier: IGFeedPostHeaderTableViewCell.identifier)
        tableView.register(IGFeedPostTableViewCell.self, forCellReuseIdentifier: IGFeedPostTableViewCell.identifier)
        tableView.register(IGFeedPostActionsTableViewCell.self, forCellReuseIdentifier: IGFeedPostActionsTableViewCell.identifier)
        tableView.register(IGFeedPostGeneralTableViewCell.self, forCellReuseIdentifier: IGFeedPostGeneralTableViewCell.identifier)
        
        
        return tableView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createMockModels()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        tableView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleNotAuthenticated()
    }
    
    
    private func createMockModels(){
        let user = User(username: "@anton",
                        bio: "",
                        name: (first: "Anton", last: "V"),
                        profilePhoto: URL(string: "https://www.google.com")!,
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
        
        var comments = [PostComment]()
        
        for i in 0..<2{
            comments.append(PostComment(commentID: "\(i)",
                                        username: "@jenny",
                                        text: "Good post",
                                        createdDate: Date(),
                                        likes: []))
        }
        
        for i in 0..<5{
            let viewModel = HomeFeedRenderViewModel(header: PostRenderViewModel(renderType: .header(provider: user)),
                                                    post: PostRenderViewModel(renderType: .primaryContent(provider: post)),
                                                    actions: PostRenderViewModel(renderType: .actions(provider: "")),
                                                    comments: PostRenderViewModel(renderType: .comments(comments: comments)))
            feedRenderModels.append(viewModel)
            
        }
        
    }
    
    
    private func handleNotAuthenticated(){
        // check auth status
        if Auth.auth().currentUser == nil{
            // Show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false, completion: nil)
        }
        
    }

}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return feedRenderModels.count*4  //each model has 4 sections
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // instead of rows I use subSections
        let sect = section
        let model: HomeFeedRenderViewModel
        if sect == 0{ // as we can't devide by 0
            model = feedRenderModels[0]
            
        }else{
            let position = sect%4 == 0 ? sect/4 : (sect-(sect%4))/4
            model = feedRenderModels[position]
        }

        let subSection = sect%4
        
        if subSection == 0{
            // header
            return 1
        }else if subSection == 1{
            //post
            return 1
            
        }else if subSection == 2{
            //actions
            return 1
        }else if subSection == 3{
            //comments
            switch model.comments.renderType{
            case .comments(let comments):
                return comments.count > 2 ? 2 : comments.count
                
                
            case .header, .primaryContent, .actions: return 0
                //unknown enforces switch to be exhaustive. Gives in code warning
//            @unknown default:
//                fatalError("Invalid case")
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sect = indexPath.section
        let model: HomeFeedRenderViewModel
        if sect == 0{ // as we can't devide by 0
            model = feedRenderModels[0]
        }else{
            let position = sect%4 == 0 ? sect/4 : (sect-(sect%4))/4
            model = feedRenderModels[position]
        }
        
        
        // get the cell
        
        let subSection = sect%4
        
        if subSection == 0{
            // header
            
            switch model.header.renderType{
            case .header(let user):
                let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostHeaderTableViewCell.identifier, for: indexPath) as! IGFeedPostHeaderTableViewCell
            case .comments, .primaryContent, .actions: return UITableViewCell()
            }
        }else if subSection == 1{
            //post
            
            switch model.post.renderType{
            case .primaryContent(let post):
                let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostTableViewCell.identifier, for: indexPath) as! IGFeedPostTableViewCell
            case .header, .comments, .actions: return UITableViewCell()
            }
        }else if subSection == 2{
            //actions
            
            switch model.actions.renderType{
            case .actions(let provider):
                let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostActionsTableViewCell.identifier, for: indexPath) as! IGFeedPostActionsTableViewCell
            case .header, .comments, .primaryContent: return UITableViewCell()
            }
            
            
        }else if subSection == 3{
            //comments
            
            switch model.comments.renderType{
            case .comments(let comments):
                let cell = tableView.dequeueReusableCell(withIdentifier: IGFeedPostGeneralTableViewCell.identifier, for: indexPath) as! IGFeedPostGeneralTableViewCell
            @unknown default:
                fatalError("Invalid case")
            }
            
        }
        
        return UITableViewCell()

    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
                
        let subSection = indexPath.section%4
        
        if subSection == 0{
            //header
            return 70
        }else if subSection == 1{
            //post
            return tableView.width
        }else if subSection == 2{
            //action
            return 60
        }else if subSection == 3{
            //comment
            return 50
        }else{
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
    
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let subSection = section%4
        return subSection == 3 ? 70 : 0
    }
    
}

