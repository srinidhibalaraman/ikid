//
//  FirstViewController.swift
//  iKid
//
//  Created by Srinidhi Balaraman on 5/2/22.
//

import UIKit

class FirstViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    var _data : String? = nil
    var data : String? {
        get { return self._data }
        set(value) {
            self._data = value
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateJoke()

        // Do any additional setup after loading the view.
    }
    
    func updateJoke() {
        questionLabel.text = data
    }
    
//    func updateData(_ joke: String) {
//        data = joke
//        updateJoke()
//    }
}
