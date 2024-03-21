//
//  ViewController.swift
//  Counter
//
//  Created by 박준영 on 3/18/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    var count: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countLabel.text = String(count)
    }
    
   
    @IBAction func decreaseButtonTapped(_ sender: UIButton) {
        count -= 1
        countLabel.text = String(count)
        
    }
    

    @IBAction func increaseButtonTapped(_ sender: UIButton) {
        count += 1
        countLabel.text = String(count)
    }
    
    
}

