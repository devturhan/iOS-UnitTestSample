//
//  ViewController.swift
//  iOS-Test
//
//  Created by Ömer Turhan on 13.10.2018.
//  Copyright © 2018 Ömer Turhan. All rights reserved.
//

import UIKit

//sourcery: AutoMockable
protocol UserViewControllerProtocol: UserViewModelDelegate {
    var viewModel: UserViewModelProtocol! { get set }
}

class UserViewController: UIViewController, UserViewControllerProtocol {
    
    @IBOutlet weak var label: UILabel!
    
    var viewModel: UserViewModelProtocol!
    
    static func instantiate(viewModel: UserViewModelProtocol = UserViewModel()) -> UserViewController {
        let bundle = Bundle(for: UserViewController.self)
        let vc: UserViewController = UIStoryboard(name: "Main", bundle: bundle)
            .instantiateViewController(withIdentifier: "UserViewController") as! UserViewController
        viewModel.delegate = vc
        vc.viewModel = viewModel
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.viewModel.fetchUser()
    }
    
    func userFetchOnSuccess(user: User) {
        self.label.text = user.description
    }
    
    func userFetchOnError() {
        self.label.text = "ERROR"
    }


}
