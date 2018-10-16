//
//  ComposeViewController.swift
//  twitter_alamofire_demo
//
//  Created by user144731 on 10/14/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import AlamofireImage


protocol ComposeViewControllerDelegate: NSObjectProtocol {
    func did(post: Tweet)
}

class ComposeViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var composeTextField: UITextView!
    @IBOutlet weak var composeCharacterCount: UILabel!
    @IBOutlet weak var composeScreenName: UILabel!
    @IBOutlet weak var composeButton: UIButton!
    @IBOutlet weak var composeImage: UIImageView!
    
    weak var delegate: ComposeViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        //changing the picture view
        self.view.layoutIfNeeded()
        composeTextField.delegate = self
        makePretty()
        
        // Do any additional setup after loading the view.
    }
    
    func makePretty()
    {
            //Making a border around image and coloring it.
        composeImage.layer.cornerRadius = composeImage.frame.size.width/2
        composeImage.clipsToBounds = true
        composeImage.layer.borderWidth = 4
        composeImage.layer.borderColor = UIColor(red: 29/255, green: 202/255, blue: 255/255, alpha: 1.00).cgColor
        
            //making a border for the text and initially filling it
        composeTextField.layer.borderWidth = 4.0
        composeTextField.layer.borderColor = UIColor(red: 29/255, green: 202/255, blue: 255/255, alpha: 1.00).cgColor
        composeTextField.text = "What's Happening?"
        composeTextField.textColor = UIColor(red: 29/255, green: 161/255, blue: 242/255, alpha: 1.00)
        
            //adding screen name and profile image
        composeScreenName.text = "@" + String((User.current?.screenName)!)
        let profileImage = URL(string: (User.current?.profileImage)!)
        composeImage.af_setImage(withURL: profileImage!)
        
    }
    
    @IBAction func didTapPost(_ sender: Any) {
        
        APIManager.shared.composeTweet(with: composeTextField.text) { (tweet, error) in
            if let error = error {
                print("Error composing Tweet: \(error.localizedDescription)")
            } else if let tweet = tweet {
                self.delegate?.did(post: tweet)
                print("Compose Tweet Success!")
                self.dismiss(animated: true, completion: nil)
                self.performSegue(withIdentifier: "twitSegue", sender: Any?.self)
            }
        }
       
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        composeTextField.textColor = UIColor.black
        composeTextField.text = ""
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        let characterLimit = 140
        
        let newText = NSString(string: textView.text!).replacingCharacters(in: range, with: text)
        
        composeCharacterCount.text = String(140-newText.characters.count)
        if newText.characters.count >= 130 {
            composeCharacterCount.textColor = UIColor.red
        }
        else {
            composeCharacterCount.textColor = UIColor.darkGray
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
