//
//  GameListViewController.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import UIKit

class GameListViewController: UIViewController {

    @IBOutlet weak var gamesSearchBar: UISearchBar!
    @IBOutlet private weak var gamesTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setup(){
        setupTable()
    }
    
    private func setupTable(){
        let cellNib = UINib(nibName: GameTableViewCell.NIB_NAME, bundle: nil)
        gamesTableView.register(cellNib, forCellReuseIdentifier: GameTableViewCell.REUSE_IDENTIFIER)
    }
    
}

extension GameListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.REUSE_IDENTIFIER, for: indexPath)
        return cell
    }
}
