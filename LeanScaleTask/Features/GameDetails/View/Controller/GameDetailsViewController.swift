//
//  GameDetailsViewController.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 05/09/2021.
//

import UIKit

class GameDetailsViewController: UIViewController {

    @IBOutlet weak var gameImageView: UIImageView!
    @IBOutlet weak var gameDescribtionValueLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var toggleReadButton: UIButton!
    var presenter: GameDetailsPresenterInputProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        setupNavbar()
    }
    
    private func setupNavbar(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favourite", style: .plain, target: self, action: #selector(makeItemFavourite))
    }
    
    @objc private func makeItemFavourite(){
        
    }
    
    @IBAction func toggleReadButton(_ sender: Any) {
        
    }
    
    @IBAction func visitRedditButton(_ sender: Any) {
        
    }
    
    @IBAction func visitWebsiteButton(_ sender: Any) {
        
    }
}

extension GameDetailsViewController: GameDetailsViewProtocol{
    func showLoading() {
        self.view.showLoading()
    }
    
    func hideLoading() {
        self.view.hideLoading()
    }
    
    func showError(message: String) {
        self.view.showError(message: message)
    }
    
    func reloadData(viewModel: GameDetailsViewModel) {
        gameImageView.loadImageUsingCache(withUrl: viewModel.imageURL)
        gameNameLabel.text = viewModel.gameName
        gameDescribtionValueLabel.text = viewModel.gameDescription
        gameDescribtionValueLabel.numberOfLines = presenter?.describtionLinesNumber ?? 0
        toggleReadButton.isSelected = presenter?.isDescribtionExpanded ?? false
    }
    
    func openURL(url: String) {
        openURLInSafari(urlString: url)
    }
    
    func toggleDescription() {
        gameDescribtionValueLabel.numberOfLines = presenter?.describtionLinesNumber ?? 0
        toggleReadButton.isSelected = presenter?.isDescribtionExpanded ?? false
    }
    
    
}
