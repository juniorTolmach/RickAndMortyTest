//
//  TableViewCell.swift
//  RickAndMortyTest
//
//  Created by Daniil Oreshenkov on 11.04.2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var characterImageView: UIImageView! {
        didSet{
            characterImageView.layer.cornerRadius = characterImageView.frame.height / 2
            characterImageView.backgroundColor = .white
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configure(with charater: Character?) {
        nameLabel.text = charater?.name
        DispatchQueue.global().async {
            guard let stringUrl = charater?.image else { return }
            guard let imageUrl = URL(string: stringUrl) else { return}
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }
}
