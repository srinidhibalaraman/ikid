//
//  ViewController.swift
//  iKid
//
//  Created by Srinidhi Balaraman on 5/1/22.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    var firstViewController : FirstViewController! = nil
    var secondViewController : SecondViewController! = nil
    
    var jokes = ["Have you heard of the new band 1023 Megabytes?", "Was Albert Einstein a real person?", "I tried to catch fog yesterday."]
    var answers = ["They're pretty good, but they don't have a gig just yet.", "I thought he was a theoretical physicist.", "Mist."]
    
    var viewsList = ["dad", "pun", "good"]
    
    var currJoke = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        decideJokeType()
//        print("I am here")
        switchViewController(nil, to: firstViewController)
    }
    
    func decideJokeType() {
        if (viewsList[currJoke] != self.restorationIdentifier!) {
            if (self.restorationIdentifier == "dad") {
                currJoke = 0
            } else if (self.restorationIdentifier == "pun") {
                currJoke = 1
            } else if (self.restorationIdentifier == "good") {
                currJoke = 2
            } else {
                currJoke = 0
            }
        }
        print("index:\(currJoke)")
        if (firstViewController == nil) {
            firstBuilder(currJoke)
        }
        
        if(secondViewController == nil) {
            secondBuilder(currJoke)
        }
    }
    
    @IBAction func switchViews(_ sender: Any) {
//        secondBuilder()
//        firstBuilder()
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)

        if firstViewController != nil &&
            firstViewController?.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            secondViewController!.view.frame = self.view.frame
            switchViewController(firstViewController, to: secondViewController)
        }
        else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            firstViewController.view.frame = view.frame
            switchViewController(secondViewController, to: firstViewController)
        }
        UIView.commitAnimations()
    }
    
    fileprivate func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        decideJokeType()
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
    
    
    fileprivate func firstBuilder(_ index: Int) {
        if firstViewController == nil {
            firstViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "First")
                as! FirstViewController
            firstViewController!.data = jokes[index]
            print(jokes[index])
        }
    }
    fileprivate func secondBuilder(_ index: Int) {
        if secondViewController == nil {
            secondViewController =
                storyboard?
                    .instantiateViewController(withIdentifier: "Second")
                as! SecondViewController
            secondViewController!.data = answers[index]
            print(answers[index])
        }
    }


}

