//
//  CharacterListScreenViewController.swift
//  CoCCharacterSheet
//
//  Created by Jorge Carvalho on 30/12/20.
//

import UIKit

class CharacterListScreenViewController: UIViewController {

    @IBOutlet weak var CharacterList: UICollectionView!
    
    var arrayCharacters = [Character]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let LisaSu = Character(image: "lisaSu", name: "Lisa Su", className: "Engineer", level: 10)
        let Freud = Character(image: "freud", name: "Sigmund Froid", className: "Parapsychologist", level: 1)
        
        arrayCharacters.append(LisaSu)
        arrayCharacters.append(Freud)
        arrayCharacters.append(LisaSu)
        arrayCharacters.append(Freud)
        arrayCharacters.append(LisaSu)
        arrayCharacters.append(Freud)
        arrayCharacters.append(LisaSu)
        
        CharacterList.delegate = self
        CharacterList.dataSource = self
        
        let nib = UINib(nibName: "CharacterCollectionViewCell", bundle: nil)
        self.CharacterList.register(nib, forCellWithReuseIdentifier: "CharacterCollectionViewCell")
    }
    

}

extension CharacterListScreenViewController: UICollectionViewDelegate {
}

extension CharacterListScreenViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCharacters.count
    }
    
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharacterCollectionViewCell", for: indexPath) as! CharacterCollectionViewCell
        let name = arrayCharacters[indexPath.row].name
        let image = arrayCharacters[indexPath.row].image
        let className = arrayCharacters[indexPath.row].className
        let level = arrayCharacters[indexPath.row].level
        cell.setup(image: image, name: name, className: className, level: level, navigationController: self.navigationController)

        return cell
    }
}

extension CharacterListScreenViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let viewSize = view.frame.size.width

        return CGSize(width: viewSize, height: 70)
    }
}
