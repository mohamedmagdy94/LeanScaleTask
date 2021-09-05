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
