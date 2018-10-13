//
//  TimelineViewController.swift
//  twitter_alamofire_demo
//
//  Created by Roberto Bradley on 2018-06-10.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit



class TimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tweets: [Tweet] = []
    var myIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func onLogout(_ sender: Any) {
        APIManager.shared.logout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        //Refresh controller initializer
         let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
         tableView.insertSubview(refreshControl, at: 0)
        
       tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        //tableView.rowHeight = 200
        
        APIManager.shared.getHomeTimeLine { (tweets, error) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
            } else if let error = error {
                print("Error getting home timeline: " + error.localizedDescription)
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweets.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        
        cell.tweet = tweets[indexPath.row]
        
        return cell
    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        APIManager.shared.getHomeTimeLine {(tweets, error) in
            if let tweets = tweets {
                self.tweets = tweets
                self.tableView.reloadData()
            }
            else if let error = error{
                print("There was an error in getting home timeline" + error.localizedDescription)
            }
            self.tableView.reloadData()
            
            refreshControl.endRefreshing()
        }
       
    }
    
    
    // Get the new view controller using segue.destinationViewController.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //  Pass the selected object to the new view controller.
        print("made it to segue")
        if let detailView = segue.destination as? DetailViewController {
            print("detailview blah blah")
            let cell = sender as! UITableViewCell
            if let indexPath = tableView.indexPath(for: cell){
                let tweet = tweets[indexPath.row]
                detailView.tweet = tweet
                
            }
            
            
        }
        
    }
    /*
    // MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    
*/

}
