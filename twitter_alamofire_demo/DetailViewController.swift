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
        fetchData()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func detaildidTapFavorite(_ sender: Any)
    {
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
    
    @IBAction func detaildidTapRetweet(_ sender: Any)
    {
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
    
    func fetchData()
    {
        
        if let tweet = tweet {
            //setup Image
            let profileImage = NSURL(string: tweet.user!.profileImage!)
            detailImageView.setImageWith(profileImage! as URL)
            detailImageView.layer.cornerRadius = detailImageView.frame.size.width/2
            detailImageView.clipsToBounds = true
            detailImageView.layer.borderWidth = 3
            detailImageView.layer.borderColor = UIColor(red: 29/255, green: 202/255, blue: 255/255, alpha: 1.00).cgColor
            
            detailNameLabel.text = tweet.user!.name
            detailScreenNameLabel.text = "@" + (tweet.user!.screenName)!
            detailStoryLabel.text = tweet.text
            detailDateTimeLabel.text = tweet.createdAtString
            detailFavoriteCountLabel.text = String(tweet.favoriteCount!)
            detailRetweetCountLabel.text = String(tweet.retweetCount!)
            
        }
        
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
   

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let replyViewController = segue.destination as! ReplyViewController
        replyViewController.tweet = tweet
        
    }
    
}
