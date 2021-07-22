//
//  screenTwoViewModel.swift
//  test_app
//
//  Created by Letnja Praksa 2 on 20.7.21..
//

import UIKit

class ScreenOneViewModel: NSObject {
    
    var repository: Repository!
    @objc dynamic var air: Air?
    
    
    init (repository: Repository){
        self.repository = repository
    }
    
    func onViewDidLoad(){
        getLatest()
    }

    
    private func getLatest(){
        repository.getLatest(){result in
            switch result{
            case .success(let air):
                self.air = air
            case .failure(let error):
            break
            }
        }
        
    }


}
