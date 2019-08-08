//
//  ViewController.swift
//  Todoey
//
//  Created by Adilson Ebo on 8/6/19.
//  Copyright © 2019 Adilson Ebo. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Bacar", "Adao", "Joel", "Wagner"]
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
            itemArray = items
        }
        
        
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
    
    
    //MARK - ADD NEW ITEM
    
    
    @IBAction func btnAddPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        //codigo para criar caixa de dialogo
        
        let alert = UIAlertController(title: "Add novo item", message: "", preferredStyle: .alert)
        
        //codigo de açao da caixa de dialogo
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            print("Sucesso!")
            //print(textField.text)
            //codigo que add o item no array
            self.itemArray.append(textField.text!)
            
            //codigo que permite guardar os dados adicionado
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            //codigo que atualiza os dados do array
            self.tableView.reloadData()
            
        }
        
        //codigo que adiciona um textFild na caixa de dialogo
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Criar novo item"
            print(alertTextField)
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    

}

