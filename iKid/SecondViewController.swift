//
//  SecondViewController.swift
//  iKid
//
//  Created by Srinidhi Balaraman on 5/2/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    var _data : String? = nil
    var data : String? {
        get { return self._data }
        set(value) {
            self._data = value
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateAnswer()

        // Do any additional setup after loading the view.
    }
    
    func updateAnswer() {
        answerLabel.text = data
    }
}
