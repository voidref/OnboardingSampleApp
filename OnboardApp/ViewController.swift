//
//  ViewController.swift
//  OnboardApp
//
//  Created by Alan Westbrook on 4/1/16.
//  Copyright © 2016 rockwood. All rights reserved.
//

import UIKit
import Onboarding

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appLabel = UILabel()
        appLabel.translatesAutoresizingMaskIntoConstraints = false
        appLabel.text = "App Goes Here"
        view.addSubview(appLabel)
        view.addConstraint(NSLayoutConstraint.constraintFor(view: appLabel, attribute: .CenterY, equalToView: view))
        view.addConstraint(NSLayoutConstraint.constraintFor(view: appLabel, attribute: .CenterX, equalToView: view))

        let ob = OnboardingViewController()
        addChildViewController(ob)
        view.addSubview(ob.view)
        
        ob.skipPosition = .topLeft

        view.addConstraints(NSLayoutConstraint.constraintsFor(view: ob.view, fillingParentView: view))
        
        let firstPage = OnboardingContentPage(titleText: "First!", contentText: "Some content that's all cool and stuff")
        
        let fgi = UIImage(named: "archer.corgi")
        let secondPage = OnboardingContentPage(titleText: "Inexplicably longer winded title that should wrap!", contentText: "Some content that's all cool and stuff, yet is rather long winded so that it can wrap.", foregroundImage: fgi, pageStyle: .titleSubordinate)
        
        let finalPage = OnboardingFinalPage(titleText: "Done!")
        
        ob.setPages([firstPage, secondPage, finalPage])
        
        ob.doneAction = { obc in            
            UIView.animateWithDuration(0.3, animations: { 
                    obc.view.alpha = 0
                }, completion: { done in
                    obc.view.removeFromSuperview()
                    obc.removeFromParentViewController()
            })
        }        
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

