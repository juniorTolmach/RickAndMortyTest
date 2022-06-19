//
//  CharacterTableViewController.swift
//  RickAndMortyTest
//
//  Created by Daniil Oreshenkov on 11.04.2022.
//

import UIKit

class CharacterTableViewController: UITableViewController {
    
    private var rickAndMorty: RickAndMorty?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 70
        tableView.backgroundColor = .black
        
        fetchData(from: Link.rickAndMorty.rawValue)
        setupNavigationBar()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let character = rickAndMorty?.results[indexPath.row]
        cell.configure(with: character)
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        guard let character = rickAndMorty?.results[indexPath.row] else { return }
        guard let detailVC = segue.destination as? CharacterDetailsViewController else { return }
        
        detailVC.character = character
    }
    
    @IBAction func updateData(_ sender: UIBarButtonItem) {
        sender.tag == 1
            ? fetchData(from: rickAndMorty?.info.next)
            : fetchData(from: rickAndMorty?.info.prev)
    }
    
    
    private func fetchData(from url: String?) {
        NetworkManager.shared.fecthDate(from: url) { rickAndMorty in
            self.rickAndMorty = rickAndMorty
            self.tableView.reloadData()
        }
    }
    
    private func setupNavigationBar() {
        
        title = "Rick & Morty"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Navigation bar appearance
        if #available(iOS 13.0, *) {
            let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.backgroundColor = .black
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]

            navigationController?.navigationBar.standardAppearance = navBarAppearance
            navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        }
    }
}
