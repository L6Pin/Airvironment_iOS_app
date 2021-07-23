//
//  PhotoScreenViewModel.swift
//  test_app
//
//  Created by Letnja Praksa 2 on 21.7.21..
//

import UIKit

class ScreenTwoViewModel: BaseViewModel{
    
    var repository: Repository!
    @objc dynamic var measurements: Array<Air>?

    init (repository: Repository){
        self.repository = repository
    }
    
    override func onViewDidLoad() {
        super.onViewDidLoad()
        getAll()
    }
    
    private func getAll(){
        loading = true
        repository.getAll(){result in
            switch result{
            case .success(let measurements):
                self.measurements = measurements
            case .failure(let error):
            print(error)
            }
            self.loading = false
        }}
    

}
