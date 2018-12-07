//
//  Store.swift
//  RePert
//
//  Created by Denis Kirillov on 02/12/2018.
//  Copyright © 2018 Denis Kirillov. All rights reserved.
//

import ReSwift

let store = Store<AppState>(
    reducer: rootReducer,
    state: nil,
    middleware:[]
)

