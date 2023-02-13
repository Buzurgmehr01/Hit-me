//
//  ViewController.swift
//  Hit me
//
//  Created by Temp on 19/12/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var score = 0
    var round = 0
    
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var number: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundValue = slider.value.rounded()
        currentValue = Int(roundValue)
        startNewGame()
        
        let thumbImageNormal = UIImage(imageLiteralResourceName: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(imageLiteralResourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(imageLiteralResourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        
        let trackRightImage = UIImage(imageLiteralResourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        }
    
    
    @IBAction func KnockKnock(){
        
        
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        score += points
        
        
        let title: String
        if difference == 0{
            title = "Perfect!"
            points += 100
        } else if difference < 5{
            title = "You are almost done it!"
            if difference == 1{
                points += 50
            }
        } else if difference < 10 {
            title = "Good!"
        } else {
            title = "Not even close..."
        }
        
        let massage = "Your score is \(points) point"
        
        let alert = UIAlertController(title: title, message: massage, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "NO", style: .default, handler: {
            action in
            self.startNewRound()
        } )
        
        alert.addAction(action)
        
        present(alert, animated: true)
        
    }
    
    @IBAction func sliderMove(_ slider: UISlider){
        let roundValue = slider.value.rounded()
        currentValue = Int(roundValue)
        
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        round += 1
        updateLable()
    }
    func updateLable(){
        number.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    @IBAction func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
    
    
}

