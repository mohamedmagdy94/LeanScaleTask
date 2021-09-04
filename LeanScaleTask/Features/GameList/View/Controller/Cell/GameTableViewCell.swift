//
//  GameTableViewCell.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    static var REUSE_IDENTIFIER = "GAME_LIST_CELL"
    static var NIB_NAME = "GameTableViewCell"
    
    @IBOutlet private weak var gameThumbImage: UIImageView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var metaCriticScoreLabel: UILabel!
    @IBOutlet private weak var categoriesLabel: UILabel!
    
    func config(with viewModel: GameListCellViewModel){
        self.backgroundColor = viewModel.color
        gameThumbImage.loadImageUsingCache(withUrl: viewModel.imageURL)
        gameNameLabel.text = viewModel.title
        metaCriticScoreLabel.text = viewModel.metacritic
        categoriesLabel.text = viewModel.categories
    }
    
}
