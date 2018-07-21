//
//  ViewController.swift
//  Todoey
//
//  Created by Manon Huet on 18-07-19.
//  Copyright © 2018 Manon Huet. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
  
    var itemArray =  [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        newItem.done = true
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        // TableView delegate
//        if let items = defaults.array(forKey: "TodoListArray") as? [String] {
//           itemArray = items
//    }
}
    //Mark - Méthode de source de données(Écrire -> TableView) pour spécifier ce que les cellules doivent afficher et combien de lignes.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Va conter le nombre d'items dans le tableau.
        return itemArray.count
    }

    //MARK - insert le chemin location Table view (indexPath)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        //Créer une cellule, qui contient le nom de notre cellule."ToDoItemCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        //Envoyer l'étiquette de texte dans chaque cellule unique.
        cell.textLabel?.text = item.title
        
        //Ternary operator ==>
        //value = condition ? valueIfTrue : valueIfFalse
        cell.accessoryType = item.done ? .checkmark : .none
        
       /* if item.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }*/
        //Retourner à la Table View comme une route
        return cell 
    }
    
    // MARK - TableView delegate méthode
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Remplace le code en dessous.
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
      /*  if itemArray[indexPath.row].done == false {
            itemArray[indexPath].done = true
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }*/
        
        tableView.reloadData()
        
        //La cellule ne reste pas sélectionnés en gris, elle redevient blanche.
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //MARK - Ajouter des nouveaux éléments.
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        //Variable locale qui va servir dans le code entier pour impression pour add item
        var textField = UITextField()
        
        //Avoir un champ de texte, pour écrire et ajouter un élément dans la liste.
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        // Créer une action
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            //Action lorsque l'utilisateur clique sur le bouton pour ajouter un item(+), il ajoute dans le tableau.
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            //reload -> recharge les lignes dans les sections de la table pour prendre les nouvelles données pour le mettre dans le tableau.
            self.tableView.reloadData()
            
        }
        //Ajouter un champ de texte dans l'alerte pour que l'utilisateur puisse écrire et écrire la variable pour sauvegarder dans la liste.
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        // Ajoutons l'action à motre alerte.
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}




