//
//  InitialScreenViewController.swift
//  CoCCharacterSheet
//
//  Created by Jorge Carvalho on 30/12/20.
//

import UIKit

class InitialScreenViewController: UIViewController {
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var downArrowImage: UIImageView!
    var viewModel = InitialScreenViewModel()
    override func viewDidLoad() {
        setArrow()
        setNavigation()
    }
    
    func setArrow() {
        viewModel.downArrowImage = downArrowImage!
        viewModel.setArrow(color: "white")
    }
    
    func setNavigation() {
        viewModel.setNavigation(navigationController: navigationController!)
    }
    
    @IBAction func handlePan(_ recognizer: UIPanGestureRecognizer) {
        self.viewModel.handleMainContainerPan(recognizer: recognizer)
    }
}
