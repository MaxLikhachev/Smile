//
//  ViewController.swift
//  first_lab
//
//  Created by Максим Лихачев on 02.03.2020.
//  Copyright © 2020 Максим Лихачев. All rights reserved.
//

import UIKit

class SmileViewController: UIViewController {

    var expression = FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile) {
        didSet {
            updateUI()
        }
    }

    @IBOutlet weak var smileView: SmileView! {
        didSet {
            updateUI()
        }
    }

    private var mouthCurvatures = [FacialExpression.Mouth.Frown: -1.0, .Grin: 0.5, .Smile: 1.0, .Smirk: -0.5, .Neutral: 0.0]
    private var eyeBrowTilts = [FacialExpression.EyeBrows.Relaxed: 0.5, .Furrowed: -0.5, .Normal: 0.0]

    private func updateUI() {
        switch expression.eyes {
        case .Open: smileView.eyesOpen = true
        case .Closed: smileView.eyesOpen = false
        case .Squinting: smileView.eyesOpen = false
        }
        smileView.mouthCurvature = mouthCurvatures[expression.mouth] ?? 0.0
        smileView.eyeBrowTilt = eyeBrowTilts[expression.eyeBrows] ?? 0.0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

