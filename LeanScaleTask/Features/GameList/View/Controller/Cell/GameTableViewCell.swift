//
//  GameTableViewCell.swift
//  LeanScaleTask
//
//  Created by Mohamed Eltaweel on 04/09/2021.
//

import UIKit

class GameTableViewCell: UITableViewCell {

    static var REUSE_IDENTIFIER = "GAME_LIST_CELL"
    
    @IBOutlet private weak var gameThumbImage: UIImageView!
    @IBOutlet private weak var gameNameLabel: UILabel!
    @IBOutlet private weak var metaCriticScoreLabel: UILabel!
    @IBOutlet private weak var categoriesLabel: UILabel!
    
    func config(with viewModel: GameListCellViewModel){
        
    }
    
}
