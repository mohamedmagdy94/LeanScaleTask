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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentSize.height - scrollView.contentOffset.y - scrollView.frame.height < 0 {
            presenter?.willDisplayLastItem()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onGameSelected(index: indexPath.item)
    }
    
}

extension GameListViewController:GameListViewProtocol{
    func showLoading() {
        self.view.showLoading()
    }
    
    func hideLoading() {
        self.view.hideLoading()
    }
    
    func showError(message: String) {
        self.view.showError(message: message)
    }
    
    func reloadList() {
        self.gamesTableView.reloadData()
    }
    
}
