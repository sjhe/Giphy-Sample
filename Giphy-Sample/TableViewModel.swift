//
//  TableViewModel.swift
//  Giphy-Sample
//
//  Created by John He on 2018-03-31.
//  Copyright © 2018 sjhe. All rights reserved.
//

import Foundation
import RxSwift

let requiredSearchLength = 3

struct TableViewModel {
    
    var searchText = Variable<String>("")
    
    var isValid: Observable<Bool> {
        return searchText.asObservable().map{
            text -> Bool in
            text.characters.count >= requiredSearchLength
        }
    }
    
    private let giphyList = Variable<String>("")
    private let isLoadingVariable = Variable(false)

}
