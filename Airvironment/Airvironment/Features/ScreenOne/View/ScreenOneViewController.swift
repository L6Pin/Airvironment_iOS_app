//
//  ScreenOneViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 22.7.21..
//

import UIKit

class ScreenOneViewController: BaseViewController<ScreenOneViewModel>{

    
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var poll: UILabel!
    @IBOutlet weak var hum: UILabel!
   
    @IBOutlet weak var temp: UILabel!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        viewModel = ScreenOneViewModel(repository:RepositoryImplementation())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var observer: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        observeLiveData()
        viewModel.onViewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    private func superDetail(air:Air) {
        var formater = DateFormatter()
        formater.dateFormat = "yyyy-MM-dd HH:mm:ss"
        self.temp.text = String(air.temperature)
        self.hum.text = String(air.humidity)
        self.poll.text = String(air.pollution)
        self.date.text = formater.string(from: air.created)
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
