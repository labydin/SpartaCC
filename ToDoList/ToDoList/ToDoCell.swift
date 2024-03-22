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
        if sender.isOn {
            toDoLabel.textColor = .gray
            toDoLabel.attributedText = toDoLabel.text?.strikeThrough()
        } else  {
            toDoLabel.textColor = .black
        }
    }
    
}


extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
