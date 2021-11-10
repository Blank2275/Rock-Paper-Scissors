//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Connor Reed on 11/10/21.
//

import UIKit
import SafariServices

class ViewController: UIViewController, SFSafariViewControllerDelegate
{

    @IBOutlet var choices: [UIImageView]!
    @IBOutlet weak var choicesStackView: UIStackView!
    @IBOutlet weak var computerDisplay: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    var myChoice = -1
    var computerChoice = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func ChoiceSelected(_ sender: UITapGestureRecognizer) {
        var location = sender.location(in:self.choicesStackView)
        for image in self.choices{
            if image.frame.contains(location){
                self.myChoice = image.tag
                self.computerChoice = Int.random(in: 0...2)
            }
        }
        if(self.myChoice != -1){
            var name = "hjkl;'"
            if(computerChoice == 0){name = "rock"}
            if(computerChoice == 1){name = "paper"}
            if(computerChoice == 2){name = "scissors"}
            self.computerDisplay.image = UIImage(named:name)
            var result:String = ""
            //win
            if((myChoice == 0 && computerChoice == 2) || (myChoice == 1 && computerChoice == 0) || (myChoice == 2 && computerChoice == 1)){
                result = "You Win! :)"
            }
            //lost
            if((myChoice == 0 && computerChoice == 1) || (myChoice == 1 && computerChoice == 2) || (myChoice == 2 && computerChoice == 0)){
                result = "You Lose :("
            }
            //tie
            if(myChoice == computerChoice){
                result = "It's a tie :/"
            }
            self.resultText.text = result
        }
    }
    @IBAction func showRules(_ sender: Any) {
        let url = URL(string: "https://wrpsa.com/the-official-rules-of-rock-paper-scissors/")
        let svc = SFSafariViewController(url: url!)
        svc.delegate = self
        self.present(svc, animated: true, completion: nil)
    }
    

}

