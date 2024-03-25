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
    
    var switchOnDelegate: SwitchOnDelegate?
    var toDoCellIndex: Int = 0
    
    
    
    override func awakeFromNib() {
            super.awakeFromNib()
            
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    override func prepareForReuse() {       // 셀을 초기화 해주는 코드
        super.prepareForReuse()
        
        toDoLabel.attributedText = nil
        toDoLabel.textColor = .black
        completeSwitch.isOn = false
    }
    
    
    @IBAction func completeSwitchTapped(_ sender: UISwitch) {
        self.switchOnDelegate?.switchChange(index: toDoCellIndex, switchIs: sender.isOn)
        //print(toDoCellIndex)
        textChanged()
    }
    
    
    func textChanged() {
        
        if completeSwitch.isOn {
            toDoLabel.textColor = .gray
            toDoLabel.attributedText = toDoLabel.text?.strikeThrough()
        } else {
            toDoLabel.textColor = .black
            toDoLabel.attributedText = toDoLabel.text?.removeStrikeThrough()
        }
    }
    
}


extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        print(#function)
        return attributeString
    }
    
    func removeStrikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.removeAttribute(.strikethroughStyle, range: NSMakeRange(0, attributeString.length))
        print(#function)
        return attributeString
        }
}
    
    
protocol SwitchOnDelegate {
    func switchChange(index: Int, switchIs: Bool)
}
