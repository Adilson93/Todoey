//
//  ViewController.swift
//  Todoey
//
//  Created by Adilson Ebo on 8/6/19.
//  Copyright © 2019 Adilson Ebo. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["item1", "item2", "item3", "item4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //MARK - MÉTODOS DE FONTE DE DADOST ABLEVIEW
    
        //1~METODO QUE DETERMINA O NUMERO DE LINHAS
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
        //2-METODO QUE COMEÇA COM A EXIBIÇAO DA TABELA
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }
    
    
    
    
    //MARK - MÉTODOS DELEGADOS TABLEVIEW
    
        //METODO QUE ESCREVE NO CONSOLE O TESTO DA LINHA SELECIONADA
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(itemArray[indexPath.row])
        
        
       // tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        
      if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            
        }
        
        //linha de codigo que marca e desmarca o item da lista selecionado
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

