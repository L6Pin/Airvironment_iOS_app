//
//  ScreenTwoViewController.swift
//  Airvironment
//
//  Created by Letnja Praksa 2 on 22.7.21..
//

import UIKit

class ScreenTwoViewController: UIViewController {

 
    @IBOutlet weak var tableView: UITableView!
    

    let viewModel: ScreenTwoViewModel = ScreenTwoViewModel(repository:RepositoryImplementation())
    
    private var observer: NSKeyValueObservation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: ScreenTwoTableViewCell.reusableIdentifier(), bundle: nil), forCellReuseIdentifier: ScreenTwoTableViewCell.reusableIdentifier())
        observeLiveData()
        viewModel.onViewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    private func observeLiveData() {
        observer = viewModel.observe(\.measurements, options: .new) { _, measurements  in
            if let measurements = measurements.newValue{
                self.tableView.dataSource = self
                self.tableView.delegate = self

            }
            
        }
        
    }
}

extension ScreenTwoViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.measurements!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ScreenTwoTableViewCell.reusableIdentifier(), for: indexPath) as! ScreenTwoTableViewCell
        if let measurements = viewModel.measurements {
            cell.configure(measurements: measurements[indexPath.row])
        }
        
        return cell
    }
    
}

extension ScreenTwoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController!.show(ScreenTwoViewController(), sender: nil)
    }

}
