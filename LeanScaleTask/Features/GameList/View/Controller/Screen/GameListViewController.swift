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
    var presenter: GameListPresenterInputProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        setupTable()
        presenter?.onScreenAppeared()
    }
    
    private func setupTable(){
        let cellNib = UINib(nibName: GameTableViewCell.NIB_NAME, bundle: nil)
        gamesTableView.register(cellNib, forCellReuseIdentifier: GameTableViewCell.REUSE_IDENTIFIER)
    }
    
}

extension GameListViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cellsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.REUSE_IDENTIFIER, for: indexPath) as! GameTableViewCell
        if let presenter = presenter{
            cell.config(with: presenter.cells[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        UIView.animate(withDuration: 0.4) {
            cell.alpha = 1
            cell.layer.transform = CATransform3DScale(CATransform3DIdentity, 1, 1, 1)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onGameSelected(index: indexPath.item)
    }
}

extension GameListViewController:GameListViewProtocol{
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func showError(message: String) {
        
    }
    
    func reloadList() {
        
    }
    
    func focusOnItem(with index: Int) {
        
    }
    
    
}
