//
//  ScreenOneViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 22.7.21..
//

import UIKit

class ScreenOneViewController: UIViewController {

    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var poll: UILabel!
    @IBOutlet weak var hum: UILabel!
   
    @IBOutlet weak var temp: UILabel!
    
    
    let viewModel: ScreenOneViewModel = ScreenOneViewModel(repository:RepositoryImplementation())
    
    private var observer: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeLiveData()
        viewModel.onViewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    private func superDetail(air:Air) {
        self.temp.text = String(air.temperature!)
        self.hum.text = String(air.humidity!)
        self.poll.text = String(air.pollution!)
        self.date.text = String(air.created!)
    }
    private func observeLiveData() {
        observer = viewModel.observe(\.air, options: .new) { _, air  in
            if let air = air.newValue{
                self.superDetail(air: air!)
                
                
            }
        }}

    
    @IBAction func showHistory1(_ sender: Any) {
        navigationController!.show(ScreenTwoViewController(), sender: nil)
        
    }
}
