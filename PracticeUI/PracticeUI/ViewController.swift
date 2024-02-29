//
//  ViewController.swift
//  PracticeUI
//
//  Created by 박준영 on 2/28/24.
//

import UIKit

struct Family {
    let myName, bestFriendName, nextFriendName: String
}

class ViewController: UIViewController {

    let friendNames: [String] = ["Henry", "Leeo", "Jay"]
    let koreanNames: [String: String] = ["Henry": "헨리", "Leeo": "리이오", "Jay": "재이"]
    var count: Int = 0
    let friend = Family(myName: "Henry2",
                        bestFriendName: "Leeo2",
                        nextFriendName: "Jay2")
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bestFriendNameLabel: UILabel!
    @IBOutlet weak var nextFriendNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
    }

    @IBAction func didTapButton(_ sender: Any) {
        nameLabel.text = friend.myName
        bestFriendNameLabel.text = friend.bestFriendName
        nextFriendNameLabel.text = friend.nextFriendName
    }
    
}

