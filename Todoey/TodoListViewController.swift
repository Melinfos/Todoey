//
//  ViewController.swift
//  Todoey
//
//  Created by Manon Huet on 18-07-19.
//  Copyright © 2018 Manon Huet. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray =  ["Find Milk", "Buy Eggos", "Destory Demogorgon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TableView delegate
        
        
    }
    
    //Mark - Méthode de source de données(Écrire -> TableView) pour spécifier ce que les cellules doivent afficher et combien de lignes.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Va conter le nombre d'items dans le tableau.
        return itemArray.count
    }

    //insert le chemin location Table view (indexPath)
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Créer une cellule, qui contient le nom de notre cellule."ToDoItemCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        //Envoyer l'étiquette de texte dans chaque cellule unique.
        cell.textLabel?.text = itemArray[indexPath.row]
        
        //Retourner à la Table View comme une route
        return cell 
    }
    
    // TableView delegate méthode
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Imprimer index(numéro) "print(indexPath.row)"  dans la console de débogage lorsque nous sélectionnons une des cellules. Imprimer le texte "print(itemArray[indexPath.row])
        print(itemArray[indexPath.row])
        
        //Méthode enleve les éléments sélectionnés, Si "if" il y a un accessoire qui est cocher, peut décocher et la coche disparait
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            
            // si la cellule est cocher, enlever la coche
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
            
        } else {
            
            //sinon mettre une coche
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        //La cellule ne reste pas sélectionnés en gris, elle redevient blanche.
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
}




