//
//  ViewController.swift
//  Lifecycle-Methods
//
//  Created by Glenn Ludszuweit on 19/04/2023.
//

import UIKit

class ViewController: UIViewController {
    
    /*
     This is the designated initializer for creating a ViewController instance.
     It is called when the ViewController is first initialized, and it is used to set up the initial state of the ViewController.
     */
    init() {
        super.init(nibName: nil, bundle: nil)
        // Initialize any properties or setup code here
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    /*
     This method is called when the ViewController's view is first loaded into memory.
     It is responsible for creating the view hierarchy for the ViewController's view.
     */
    override func loadView() {
        // Create the view hierarchy for the ViewController's view here
    }
    
    /*
     This method is called after the ViewController's view has been loaded into memory.
     It is a good place to perform any additional setup that needs to happen after the view hierarchy has been created.
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /*
     This method is called just before the ViewController's view is about to be displayed on the screen.
     It is a good place to perform any setup that needs to happen before the view is displayed.
     */
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Perform any setup that needs to happen before the view is displayed here
    }
    
    /*
     This method is called after the ViewController's view has been displayed on the screen.
     It is a good place to perform any additional setup that needs to happen after the view has been displayed.
     */
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // Perform additional setup after the view has been displayed here
    }
    
    /*
     This method is called just before the ViewController's view is about to be removed from the screen.
     It is a good place to perform any cleanup or teardown that needs to happen before the view is removed.
     */
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Perform any cleanup or teardown that needs to happen before the view is removed here
    }
    
    /*
     This method is called after the ViewController's view has been removed from the screen.
     It is a good place to perform any additional cleanup or teardown that needs to happen after the view has been removed.
     */
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        // Perform additional cleanup or teardown after the view has been removed here
    }
}

