//
//  FavouriteListViewController.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import UIKit

class FavouriteListViewController: UIViewController {
    
    @IBOutlet weak var favouritesTableView: UITableView!
    @IBOutlet weak var emptyStateLabel: UILabel!
    var presenter: FavouriteListPresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.onScreenAppeared()
    }
    
    private func setup(){
        let cellNib = UINib(nibName: GameTableViewCell.NIB_NAME, bundle: nil)
        favouritesTableView.register(cellNib, forCellReuseIdentifier: GameTableViewCell.REUSE_IDENTIFIER)
    }
    
}

extension FavouriteListViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: GameTableViewCell.REUSE_IDENTIFIER, for: indexPath) as! GameTableViewCell
        if let presenter = presenter{
            cell.config(with: presenter.cells[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.cellsCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.onGameSelected(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            presenter?.onUnfavouriteGame(index: indexPath.row)
        }
    }
    
}

extension FavouriteListViewController: FavouriteListViewProtocol{
    
    func toggleEmptyStateVisibility(isHidden: Bool) {
        emptyStateLabel.isHidden = isHidden
    }

    func showLoading() {
        self.view.showLoading()
    }
    
    func hideLoading() {
        self.view.hideLoading()
    }
    
    func showError(message: String) {
        self.view.showError(message: message)
    }
    
    func reloadItems() {
        favouritesTableView.reloadData()
    }
    
    func confirmDelete(){
        let alert = UIAlertController(title: "Unfavourite", message: "Do you want to remove ?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.destructive, handler: {[weak self] _ in self?.presenter?.onDeleteConfirmed() }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true)

    }
}
