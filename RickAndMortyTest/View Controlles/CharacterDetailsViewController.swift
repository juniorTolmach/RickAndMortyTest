//
//  CharacterDetailsViewController.swift
//  RickAndMortyTest
//
//  Created by Daniil Oreshenkov on 12.04.2022.
//

import UIKit

class CharacterDetailsViewController: UIViewController {
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var characterInfoLabel: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        characterImageView.layer.cornerRadius = characterImageView.frame.width / 2
        
        title = character.name
        characterInfoLabel.text = character.description
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.character.image) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
