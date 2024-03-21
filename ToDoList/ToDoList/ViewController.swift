//
//  ViewController.swift
//  ToDoList
//
//  Created by 박준영 on 3/19/24.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoCell
        
        //cell.toDoLabel.text = alert.title//alert창 텍스트필드 입력내용
        
        return cell
    }
    
    
    @IBAction func addButtonTapped(_ sender: UIButton) {
        // alert 창 띄우기(텍스트필드 포함)
        // 작성한 내용 테이블뷰셀 위로 올라가게
       
        
    }
    
    
}

