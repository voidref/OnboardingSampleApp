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
        
        let onboarding = OnboardingViewController()
        
        addChildViewController(onboarding)
        view.addSubview(onboarding.view)
        onboarding.view.backgroundColor = UIColor.clear()
        
        onboarding.skipPosition = .topLeft

        NSLayoutConstraint.activate(NSLayoutConstraint.constraints(for: onboarding.view, filling: view))
        
        let firstPage = OnboardingContentPage(titleText: "First!", contentText: "Some content that's all cool and stuff")
        
        let fgi = UIImage(named: "archer.corgi")
        let secondPage = OnboardingContentPage(titleText: "Inexplicably longer winded title that should wrap!", contentText: "Some content that's all cool and stuff, yet is rather long winded so that it can wrap.", foregroundImage: fgi, pageStyle: .titleSubordinate)
        
        let finalPage = OnboardingFinalPage(titleText: "Done!")
        
        let pageList = [firstPage, secondPage, finalPage] 
        onboarding.setPages(pageList)
        
        onboarding.doneAction = { controller in            
            UIView.animate(withDuration: 0.3, animations: { 
                    controller.view.alpha = 0
                }, completion: { done in
                    controller.view.removeFromSuperview()
                    controller.removeFromParentViewController()
            })
        }
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}

