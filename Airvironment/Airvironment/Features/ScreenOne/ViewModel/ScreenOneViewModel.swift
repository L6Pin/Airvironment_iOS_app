//
//  screenTwoViewModel.swift
//  test_app
//
//  Created by Letnja Praksa 2 on 20.7.21..
//

import UIKit

class ScreenOneViewModel: BaseViewModel {
    
    var repository: Repository!
    @objc dynamic var air: Air?
    
    var timer: Timer!
    
    
    init (repository: Repository){
        self.repository = repository
    }
    
   
    
    override func onViewDidLoad(){
        super.onViewDidLoad()
        getLatest()
        self.timer = Timer.scheduledTimer(timeInterval: 600.0, target: self, selector: #selector(getLatest), userInfo:nil, repeats: true)
    }

    
    @objc private func getLatest(){
        loading = true
        repository.getLatest(){result in
            switch result{
            case .success(let air):
                self.air = air
            case .failure(let error):
            break
            }
            self.loading = false

        }
        
    }


}
