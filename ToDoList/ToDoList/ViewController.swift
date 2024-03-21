//
//  ViewController.swift
//  ToDoList
//
//  Created by 박준영 on 3/19/24.
//

import UIKit

class ViewController: UIViewController /* UITableViewDelegate*/ {
    
    @IBOutlet weak var tableView: UITableView!
    
    var listsArray: [ToDo] = []
    var todoCell = ToDoCell()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        //tableView.delegate = self
        
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // alert 창 띄우기(텍스트필드 포함)
        // 작성한 내용 테이블뷰셀 위로 올라가게
        let alert = UIAlertController(title: "할 일 추가", message: "", preferredStyle: .alert)
        
        alert.addTextField { myTextField in
            myTextField.placeholder = "할 일을 입력하세요"
        }
        
        var add = UIAlertAction(title: "추가", style: .default, handler: nil)
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(cancel)
        alert.addAction(add)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listsArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        //cell.toDoLabel.text = alert.title//alert창 텍스트필드 입력내용
        return cell
    }
    
}


extension ViewController: UITableViewDelegate {
    
}
