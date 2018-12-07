//
//  RootReducer.swift
//  RePert
//
//  Created by Denis Kirillov on 02/12/2018.
//  Copyright © 2018 Denis Kirillov. All rights reserved.
//

import ReSwift

func rootReducer(_ action: Action, _ state: AppState?) -> AppState {
    
    var state = state ?? AppState()
    guard let action = action as? Actions else { return state }
    
    switch action {
    case .updateMax(let max):
        state.max = max
    case .updateMin(let min):
        state.min = min
    case .updateExp(let exp):
        state.exp = exp
    }
    
    state.result = (state.max + state.min + 4 * state.exp) / 6.0
    return state
}
