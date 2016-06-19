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
        
        let ob = OnboardingViewController()
        
        addChildViewController(ob)
        view.addSubview(ob.view)
        ob.view.backgroundColor = UIColor.clearColor()
        
        ob.skipPosition = .topLeft

        NSLayoutConstraint.activateConstraints(NSLayoutConstraint.constraintsFor(view: ob.view, fillingParentView: view))
        
        let firstPage = OnboardingContentPage(titleText: "First!", contentText: "Some content that's all cool and stuff")
        
        let fgi = UIImage(named: "archer.corgi")
        let secondPage = OnboardingContentPage(titleText: "Inexplicably longer winded title that should wrap!", contentText: "Some content that's all cool and stuff, yet is rather long winded so that it can wrap.", foregroundImage: fgi, pageStyle: .titleSubordinate)
        
        let finalPage = OnboardingFinalPage(titleText: "Done!")
        
        let pageList = [firstPage, secondPage, finalPage] 
        ob.setPages(pageList)
        
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

