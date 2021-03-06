//
//  BaseViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 23.7.21..
//

import UIKit

class BaseViewController<T: BaseViewModel>: UIViewController {
    
    var viewModel: T!
    
    var loader: LoaderViewController = LoaderViewController()
    
    private var observer1: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeLiveData()
        viewModel.onViewDidLoad()
        
    }
    
    open func observeLiveData() {
        observer1 = viewModel.observe(\.loading, options: .new) { _, loading  in
            if let loading = loading.newValue{
                if loading == true {
                    self.loader.show()
                }
                
                else{
                    self.loader.hide()
                }
                
            }
            
        }
        
    }
    
    //extension BaseViewController: UITableViewDelegate {
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        navigationController!.show(LoaderViewController(), sender: nil)
    //    }
    //}
    
}


