//
//  ViewController.swift
//  ControllerWithControllerExample
//
//  Created by A1 on 29/09/2018.
//  Copyright © 2018 Home.Me. All rights reserved.
//

import UIKit

class MasterViewController: UIViewController {

    @IBOutlet weak var segmentedControll: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setupView()
    }

    private func setupView() {
        self.setupSegmentedControll()
        self.updateView()
    }
    
    private func setupSegmentedControll() {
        
        self.segmentedControll.removeAllSegments() // clear
        self.segmentedControll.insertSegment(withTitle: "Summary", at: 0, animated: false)
        self.segmentedControll.insertSegment(withTitle: "Session", at: 1, animated: false)
        self.segmentedControll.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
//        self.segmentedControll.setWidth(100, forSegmentAt: 0)
//        self.segmentedControll.setWidth(100, forSegmentAt: 1)
        
        self.segmentedControll.selectedSegmentIndex = 0 // set select 1 segment
    }
    
    @objc func selectionDidChange(_ sender: UISegmentedControl) {
        updateView()
    }
    
    private func updateView() {
        if self.segmentedControll.selectedSegmentIndex == 0 {
            remove(asChildVC: sessionVC)
            add(asChildVC: summaryVC)
        } else {
            remove(asChildVC: summaryVC)
            add(asChildVC: sessionVC)
        }
    }
    
    // MARK: - Create lazy child controllers
    private func add(asChildVC vc: UIViewController) {
        // add Child vc
        addChild(vc)
        
        // add Child view as Subview
        view.addSubview(vc.view)
        
        // configure Child View
        vc.view.frame = view.bounds
        vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Notify Child VC
        vc.didMove(toParent: self)
    }
    
    private lazy var summaryVC: SummaryViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // add vc as child vc
        var vc = storyboard.instantiateViewController(withIdentifier: "SummaryViewController") as! SummaryViewController
        self.add(asChildVC: vc)
        
        return vc
    }()
    
    private lazy var sessionVC: SessionViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        // add vc as child vc
        var vc = storyboard.instantiateViewController(withIdentifier: "SessionViewController") as! SessionViewController
        self.add(asChildVC: vc)
        
        return vc
    }()
    
    // MARK: - Remove child controllers
    private func remove(asChildVC vc: UIViewController) {
        // Notify Child VC
        vc.willMove(toParent: nil)
        
        // remove from superview
        vc.view.removeFromSuperview()
        
        // notify Child VC
        vc.removeFromParent()
    }
    

}

