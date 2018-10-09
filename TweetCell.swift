//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Roberto Bradley on 10/6/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage
import AFNetworking

class TweetCell: UITableViewCell {
    @IBOutlet weak var tweetProfileImage: UIImageView!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var tweetUsernameLael: UILabel!
    @IBOutlet weak var tweetScreenNameLabel: UILabel!
    @IBOutlet weak var tweetCreatedAtLabel: UILabel!
    @IBOutlet weak var tweetRetweetedLabel: UILabel!
    @IBOutlet weak var tweetFavoriteLabel: UILabel!
    @IBOutlet weak var tweetFavoriteButton: UIImageView!
    @IBOutlet weak var tweetRetweetButton: UIImageView!
    
    var tweet: Tweet! {
        didSet {
            fetchData()
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func fetchData(){
        tweetProfileImage.image = nil
        tweetTextLabel.text = tweet.text
        tweetUsernameLael.text = tweet.user?.name
        tweetScreenNameLabel.text = tweet.user?.screenName
        tweetCreatedAtLabel.text = tweet.createdAtString
        tweetRetweetedLabel.text = String(tweet.retweetCount!)
        tweetFavoriteLabel.text = String(tweet.favoriteCount!)
        
        let profileImage = NSURL(string: tweet.user!.profileImage!)
        tweetProfileImage.setImageWith(profileImage as! URL)
        
             }
    

}
