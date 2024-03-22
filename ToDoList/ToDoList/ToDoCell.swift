//
//  ToDoCell.swift
//  ToDoList
//
//  Created by 박준영 on 3/21/24.
//

import UIKit

class ToDoCell: UITableViewCell {

    @IBOutlet weak var toDoLabel: UILabel!
    
    @IBOutlet weak var completeSwitch: UISwitch!
    
    var lists = ViewController()
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    @IBAction func completeSwitchTapped(_ sender: UISwitch) {
        
    }
    
}


