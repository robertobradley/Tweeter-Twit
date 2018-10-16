//
//  ReplyViewController.swift
//  twitter_alamofire_demo
//
//  Created by user144731 on 10/13/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

protocol ReplyViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}

class ReplyViewController: UIViewController, UITextViewDelegate {
    
    
    
    
    @IBOutlet weak var replyTextField: UITextView!
    @IBOutlet weak var replyCharacterCount: UILabel!
    @IBOutlet weak var replyButton: UIButton!
    weak var delegate: ReplyViewControllerDelegate?
    
    var tweet: Tweet!

    override func viewDidLoad() {
        super.viewDidLoad()
        replyTextField.layer.borderWidth = 4.0
        replyTextField.layer.borderColor = UIColor(red: 29/255, green: 202/255, blue: 255/255, alpha: 1.00).cgColor
        replyTextField.text = "What's Happening?"
        replyTextField.textColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1.00)
        replyTextField.delegate = self
        
    }
    @IBAction func onReply(_ sender: Any) {
        let replyText = replyTextField.text
        APIManager.shared.replyTweet(with: replyText!, with: String(tweet.id!)){(tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.performSegue(withIdentifier: "backHome", sender: nil)
            }
        }
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        
        let stringToCount = "@" + String(tweet.user!.screenName!)! + " "
        let snCount = stringToCount.characters.count - 1
        
        let colorString = "@" + String(tweet.user!.screenName!)! + " " as NSString
        var myMutableString = NSMutableAttributedString()
        myMutableString = NSMutableAttributedString(string: colorString as String, attributes: [NSFontAttributeName:UIFont(name: "Verdana", size: 16.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1.00), range: NSRange(location:0,length:snCount))
        
        //replyTextField.textColor = UIColor.black
        replyTextField.attributedText = myMutableString
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let characterLimit = 140
        
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        replyCharacterCount.text = String(140-newText.characters.count)
        if newText.characters.count >= 130 {
            replyCharacterCount.textColor = UIColor.red
        }
        else {
            replyCharacterCount.textColor = UIColor.darkGray
        }
        return newText.characters.count < characterLimit
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
