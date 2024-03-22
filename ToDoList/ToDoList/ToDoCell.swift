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
    var switchOnDelegate: SwitchOnDelegate?
    var toDoCellIndex: Int = 0
    var textColor: Bool = false {
        didSet {
            textColorChanged()
        }
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    override func prepareForReuse() {       // 셀을 초기화 해주는 코드.
        super.prepareForReuse()
        
        completeSwitch.isOn = false
        toDoLabel.text = nil
        toDoLabel.textColor = .black
    }
    
    
    @IBAction func completeSwitchTapped(_ sender: UISwitch) {
        if sender.isOn {
            self.switchOnDelegate?.switchChange(index: toDoCellIndex, switchIs: true)
            textColor = sender.isOn
            
        } else  {
            self.switchOnDelegate?.switchChange(index: toDoCellIndex, switchIs: false)
            textColor = sender.isOn
        }
    }
    
    
    func textColorChanged() {
        
        if textColor {
            toDoLabel.textColor = .gray
            
        } else {
            toDoLabel.textColor = .black
        }
    }
    
}





//extension String {
//    func strikeThrough() -> NSAttributedString {
//        let attributeString = NSMutableAttributedString(string: self)
//        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
//        return attributeString
//    }
//}


protocol SwitchOnDelegate {
    func switchChange(index: Int, switchIs: Bool)
    
}
