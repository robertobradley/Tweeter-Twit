//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Roberto Bradley on 10/11/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit



class DetailViewController: UIViewController {
    
    var tweet: Tweet!
    //buttons
    @IBOutlet weak var detailFavoriteButton: UIButton!
    @IBOutlet weak var detailRetweetButton: UIButton!
    @IBOutlet weak var detailReplyButton: UIButton!
    
    //labels
    @IBOutlet weak var detailDateTimeLabel: UILabel!
    @IBOutlet weak var detailStoryLabel: UILabel!
    @IBOutlet weak var detailScreenNameLabel: UILabel!
    @IBOutlet weak var detailNameLabel: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailFavoriteCountLabel: UILabel!
    @IBOutlet weak var detailRetweetCountLabel: UILabel!
    @IBOutlet weak var detailReplyCountLabel: UILabel!
    
//-----------------View DID LOAD ----------//
    override func viewDidLoad() {
        super.viewDidLoad()
        //fetchData()
        print("made it here 2")
        if let tweet = tweet {
        let profileImage = NSURL(string: tweet.user!.profileImage!)
        detailImageView.setImageWith(profileImage! as URL)
        
        detailNameLabel.text = tweet.user!.name
        detailScreenNameLabel.text = "@" + (tweet.user!.screenName)!
        detailStoryLabel.text = tweet.text
        detailDateTimeLabel.text = tweet.createdAtString
        detailFavoriteCountLabel.text = String(tweet.favoriteCount!)
        detailRetweetCountLabel.text = String(tweet.retweetCount!)
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    /*func fetchData()
    {
    if(tweet.favorited)!{
        detailFavoriteButton.setImage(UIImage(named:"favor-icon-red"), for: .normal)
    }
    else{
        detailFavoriteButton.setImage(UIImage(named:"favor-icon"), for: .normal)
    }
    if (tweet.retweeted)!
    {
        detailRetweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
    }
    else
    {
        detailRetweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
    }
    }
   
*/
}
