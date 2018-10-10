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
    @IBOutlet weak var tweetRetweetButton: UIButton!
    @IBOutlet weak var tweetFavoriteButton: UIButton!
    
    var tweet: Tweet! {
        didSet {
            fetchData()
        }
    }
    
    
    @IBAction func didTapFavoirte(_ sender: Any) {
        if(tweet.favorited == false){
            tweet.favorited = true
            tweet.favoriteCount! += 1
            fetchData()
            APIManager.shared.favorite( tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else{
            tweet.favorited = false
            tweet.favoriteCount! -= 1
            fetchData()
            APIManager.shared.unfavorite(with: tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
                
            }
        }
        
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if(tweet.retweeted == false){
            tweet.retweeted = true
            tweet.retweetCount! += 1
            fetchData()
            APIManager.shared.favorite( tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully favorited the following Tweet: \n\(tweet.text)")
                }
            }
        }
        else{
            tweet.retweeted = false
            tweet.retweetCount! -= 1
            fetchData()
            APIManager.shared.unfavorite(with: tweet) { (tweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let tweet = tweet {
                    print("Successfully unfavorited the following Tweet: \n\(tweet.text)")
                }
                
            }
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
      
        if(tweet.favorited)!{
            tweetFavoriteButton.setImage(UIImage(named:"favor-icon-red"), for: .normal)
        }
        else{
            tweetFavoriteButton.setImage(UIImage(named:"favor-icon"), for: .normal)
        }
        if (tweet.retweeted)!
        {
            tweetRetweetButton.setImage(UIImage(named: "retweet-icon-green"), for: .normal)
        }
        else
        {
            tweetRetweetButton.setImage(UIImage(named: "retweet-icon"), for: .normal)
        }
       
       
        
        let profileImage = NSURL(string: tweet.user!.profileImage!)
        tweetProfileImage.setImageWith(profileImage! as URL)
        
             }
    

}
