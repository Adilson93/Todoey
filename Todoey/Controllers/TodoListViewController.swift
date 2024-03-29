//
//  ViewController.swift
//  Todoey
//
//  Created by Adilson Ebo on 8/6/19.
//  Copyright © 2019 Adilson Ebo. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        

        
        loadItems()
        
        
    }

    //MARK - MÉTODOS DE FONTE DE DADOS  TABLEVIEW
    
        //1~METODO QUE DETERMINA O NUMERO DE LINHAS
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
        //2-METODO QUE COMEÇA COM A EXIBIÇAO DA TABELA
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowAtIndexPath")
        
       // let cell = UITableViewCell(style: .default, reuseIdentifier: "ToDoItemCell")
        
       let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.estado ? .checkmark : .none
//
//        if item.estado == true {
//            cell.accessoryType = .checkmark
//        } else {
//             cell.accessoryType = .none
//        }
        
        return cell
    }
    
    
    
    
    //MARK - MÉTODOS DELEGADOS TABLEVIEW
    
        //METODO QUE ESCREVE NO CONSOLE O TESTO DA LINHA SELECIONADA
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].estado = !itemArray[indexPath.row].estado
        
//        if itemArray[indexPath.row].estado == false {
//            itemArray[indexPath.row].estado = true
//        } else {
//            itemArray[indexPath.row].estado = false
//        }
        
        //atualiza o tableview
        //tableView.reloadData()
        self.saveItem()
    
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
            let newItem = Item()
            newItem.title = textField.text!
            self.itemArray.append(newItem)
            
            //codigo que permite guardar os dados adicionado
            self.saveItem()
            
           
            
        }
        
        //codigo que adiciona um textFild na caixa de dialogo
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Criar novo item"
            textField = alertTextField
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    //MARK - MODEL MANUPULATION METHODS
    
    func saveItem() {
        
        //funçao que permite guardar os dados adicionado
        
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
            
        } catch {
            print("Error encoding item array, \(error)")
        }
        // self.defaults.set(self.itemArray, forKey: "TodoListArray")
        
        //codigo que atualiza os dados do array
        self.tableView.reloadData()
    }
    
    
    func loadItems() {
        
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            do {
                itemArray = try decoder.decode([Item].self, from: data)
                
            } catch {
                print("Error encoding item array, \(error)")
            }
        }
    }
    

}

