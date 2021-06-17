//
//  CharacterCollectionViewCell.swift
//  CoCCharacterSheet
//
//  Created by Jorge Roberto on 16/06/21.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var container: UIView!
    @IBOutlet weak var CharacterImage: UIImageView!
    @IBOutlet weak var CharacterName: UILabel!
    @IBOutlet weak var ClassName: UILabel!
    @IBOutlet weak var Level: UILabel!
    @IBOutlet weak var button: UIButton!
    private var navigationController: UINavigationController!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setup(image: String, name: String, className: String, level: Int, navigationController: UINavigationController!) {
        self.CharacterName.text = name
        self.CharacterImage?.image = UIImage(named: image)
        self.ClassName.text = className
        self.Level.text = "Lvl \(level)"
        self.navigationController = navigationController
        

        button.frame = CGRect(x: 0, y: 0, width: container.frame.size.width + 100, height: 70)

        
    }
    
    @IBAction func toNextScreen(_ sender: Any) {
        if let viewDetail = UIStoryboard(name: "CharacterDetailsScreen", bundle: nil).instantiateInitialViewController() as? CharacterDetailsScreenViewController {
            navigationController?.pushViewController(viewDetail, animated: true)
        }
    }

}
