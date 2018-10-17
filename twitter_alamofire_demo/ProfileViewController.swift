//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Roberto Bradley on 10/15/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage

class ProfileViewController: UIViewController {
    //OUTLETS
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var followerNumberLabel: UILabel!
    @IBOutlet weak var followedNumberLabel: UILabel!
    @IBOutlet weak var screenNameLabel: UILabel!
    @IBOutlet weak var tweetsNumberLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        makePretty()
        
        // Do any additional setup after loading the view.
    }
    
    func makePretty()
    {
        //setting user labels
        screenNameLabel.text = "@" + String((User.current?.screenName)!)
        followerNumberLabel.text = "Followers: " + String((User.current?.followersCount)!)
        followedNumberLabel.text = "followed: " + String((User.current?.friendsCount)!)
        tweetsNumberLabel.text = "Number of Tweets: " + String((User.current?.numberofTweets)!)
        
        //making image with rounded borders
        profileImageView.layer.cornerRadius = profileImageView.frame.size.width/2
        profileImageView.clipsToBounds = true
        profileImageView.layer.borderWidth = 4
        profileImageView.layer.borderColor = UIColor(red: 29/255, green: 202/255, blue: 255/255, alpha: 1.00).cgColor
        let profileImage = URL(string: (User.current?.profileImage)!)
        profileImageView.af_setImage(withURL: profileImage!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
