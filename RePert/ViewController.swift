//
//  ViewController.swift
//  RePert
//
//  Created by Denis Kirillov on 02/12/2018.
//  Copyright © 2018 Denis Kirillov. All rights reserved.
//

import UIKit
import ReSwift

class ViewController: UIViewController, StoreSubscriber {
    
    @IBAction func onMaxChanged(_ sender: Any) {
        let value = maxSlider.value.rounded()
        store.dispatch(Actions.updateMax(value))
    }
    
    @IBAction func onMinChanged(_ sender: Any) {
        let value = minSlider.value.rounded()
        store.dispatch(Actions.updateMin(value))
    }
    
    @IBAction func onExpChanged(_ sender: Any) {
        let value = expSlider.value.rounded()
        store.dispatch(Actions.updateExp(value))
    }

    override func viewDidAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    func newState(state: AppState) {
        
        minLabel.text = String(Int(state.min))
        maxLabel.text = String(Int(state.max))
        expLabel.text = String(Int(state.exp))
        
        minSlider.value = state.min
        maxSlider.value = state.max
        expSlider.value = state.exp
        
        resultLabel.text = String(format: "%.1f", state.result)
    }

    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var minLabel: UILabel!
    @IBOutlet weak var expLabel: UILabel!
    @IBOutlet weak var maxSlider: UISlider!
    @IBOutlet weak var minSlider: UISlider!
    @IBOutlet weak var expSlider: UISlider!
}

