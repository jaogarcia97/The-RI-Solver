//
//  ViewController.swift
//  RI Solver
//
//  Created by Jao Garcia on 3/24/23.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var takeQuizBtn: UIButton!
    @IBOutlet weak var createQuizBttn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Glass Button Effect: Padding correlates to the height of the button
        takeQuizBtn.addBlurEffect(style: .systemUltraThinMaterial, cornerRadius: 20, padding: 7)
        createQuizBttn.addBlurEffect(style: .systemUltraThinMaterial, cornerRadius: 20, padding: 7)

    }
    
    @IBAction func takeQuiz(_ sender: Any) {
        
        //Perform Segue
        self.performSegue(withIdentifier: "toQuizMenu", sender: self)
    }
    
    
    //TODO: Bottom Tab Bar, Quiz, LeaderBoards, Saved Problems
    

}

extension UIButton {
    func addBlurEffect(style: UIBlurEffect.Style = .regular, cornerRadius: CGFloat = 0, padding: CGFloat = 0) {
        backgroundColor = .clear
        let blurView = UIVisualEffectView(effect: UIBlurEffect(style: style))
        blurView.isUserInteractionEnabled = false
        blurView.backgroundColor = .clear
        if cornerRadius > 0 {
            blurView.layer.cornerRadius = cornerRadius
            blurView.layer.masksToBounds = true
        }
        self.insertSubview(blurView, at: 0)

        blurView.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: blurView.leadingAnchor, constant: padding).isActive = true
        self.trailingAnchor.constraint(equalTo: blurView.trailingAnchor, constant: -padding).isActive = true
        self.topAnchor.constraint(equalTo: blurView.topAnchor, constant: padding).isActive = true
        self.bottomAnchor.constraint(equalTo: blurView.bottomAnchor, constant: -padding).isActive = true

        if let imageView = self.imageView {
            imageView.backgroundColor = .clear
            self.bringSubviewToFront(imageView)
        }
    }
}

