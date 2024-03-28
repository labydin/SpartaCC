//
//  ViewController.swift
//  ToDoList
//
//  Created by 박준영 on 3/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var listsArray: [ToDo] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
        
        alert.addTextField { myTextField in
            myTextField.placeholder = "할 일을 입력하세요"
            myTextField.autocorrectionType = .no
        }
        
        let add = UIAlertAction(title: "추가", style: .default) { add in
            if let textField = alert.textFields?.first, let text = textField.text {
                self.listsArray.append(ToDo(id: self.listsArray.count, title: text, isCompleted: false))
                self.tableView.reloadData()
            }
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(add)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate, SwitchOnDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        let lists = listsArray[indexPath.row]
        
        cell.toDoLabel.text = lists.title
        cell.toDoCellIndex = indexPath.row
        cell.completeSwitch.isOn = lists.isCompleted
        cell.textChanged()
        
        cell.switchOnDelegate = self
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            listsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            
        }
    }
    
    func switchChange(index: Int, switchIs: Bool) {
            listsArray[index].isCompleted = switchIs
        }
}




