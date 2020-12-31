//
//  InitialScreenViewModel.swift
//  CoCCharacterSheet
//
//  Created by Jorge Carvalho on 30/12/20.
//

import Foundation
import UIKit

class InitialScreenViewModel {
    var downArrowImage: UIImageView!
    var initialCenter = CGFloat()
    private var recognizer: UIPanGestureRecognizer!
    private var recognizerView: UIView!
    private var navigationController: UINavigationController?
    func changeArrowImageColor(color: String) {
        UIView.animate(withDuration: 1.2) {
            self.downArrowImage.tintColor = color == "white" ? .white : .black
        } completion: { _ in
            let changeColor = color == "white" ? "black" : "white"
            self.changeArrowImageColor(color: changeColor)
        }
    }
    
    func setNavigation(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func toNextScreen() {
        self.navigationController?.isNavigationBarHidden = true
        let characterListScreen = UIStoryboard(name: "CharacterListScreen", bundle: nil).instantiateInitialViewController() as! CharacterListScreenViewController
        self.navigationController?.pushViewController(characterListScreen, animated: false)
    }
    
    func animateContainer() {
        let viewPosition = recognizerView.center.y
        let quarterOfScreen = recognizerView.frame.height - (recognizerView.frame.height * 3 / 4)
        UIView.animate(withDuration: 0.5,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                _ = self.recognizer.translation(in: self.recognizerView)
                if(viewPosition > quarterOfScreen) {
                    self.recognizerView.center.y = self.initialCenter
                }
                else{
                    self.recognizerView.center.y = -self.initialCenter
                }
                
                self.recognizer.setTranslation(.zero, in: self.recognizerView)
            },
            completion: {_ in
                if(viewPosition <= quarterOfScreen) {
                    return self.toNextScreen()
                }
            })
        }
        
    
    func handleMainContainerPan(recognizer: UIPanGestureRecognizer) {
        guard let recognizerView = recognizer.view
        else { return }
        self.recognizerView = recognizerView
        self.recognizer = recognizer
        
        switch recognizer.state {
            case .began:
                _ = recognizer.translation(in: recognizerView)
                initialCenter = recognizerView.center.y
            case .changed:
                let translation = recognizer.translation(in: recognizerView)
                recognizerView.center.y += translation.y
                recognizer.setTranslation(.zero, in: recognizerView)

            case .ended:
                return animateContainer()

            default: ()
        }
    }
}



