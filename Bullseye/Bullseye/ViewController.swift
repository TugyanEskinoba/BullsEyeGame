//
//  ViewController.swift
//  Bullseye
//
//  Created by Ali Tuğyan Eskinoba on 4.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var round = 0
 
    
    @IBOutlet weak var slider : UISlider!
    @IBOutlet weak var lblTarget : UILabel!
    @IBOutlet weak var lblScore : UILabel!
    @IBOutlet weak var lblRound : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentValue  = lroundf(slider.value)
        startNewRound()
        updateLabels()
        
        
            let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
            slider.setThumbImage(thumbImageNormal, for: .normal)
            
            let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
            slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
            
            let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0 ,right: 14)
            
            let trackLeftImage = UIImage(named: "SliderTrackLeft")!
            let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
            slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
            
            let trackRightImage = UIImage(named: "SliderTrackRight")!
            let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
            slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        
    }
    @IBAction func showAlert (){
        
        var newScore = 0
        
        if (targetValue==currentValue){
            newScore=200
            
            let message = "Score : \(newScore) Tebrikler Kazandınız"
            
            let alert = UIAlertController(title: "Bulls Eye Game", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else if (abs(targetValue-currentValue)<=5){
            newScore=150
            
            let message = "Score : \(newScore) Neredeyse Tam İsabet"
            
            let alert = UIAlertController(title: "Bulls Eye Game", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }else{
            newScore = 100-abs(targetValue-currentValue)
            
            let message = "Score : \(newScore) Bir Kere Daha Dene"
            
            let alert = UIAlertController(title: "Bulls Eye Game", message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            
        }
        
        round+=1
        score += newScore
            
        startNewRound()
        updateLabels()
        
    }
    @IBAction func sliderMoved (_ slider : UISlider){
        currentValue  = lroundf(slider.value)
    }
    
    func startNewRound (){
        targetValue = 1 + Int(arc4random_uniform(100))
        currentValue=50;
        slider.value=Float(50)
    }
    
    func updateLabels(){
        lblTarget.text = String(targetValue)
        lblRound.text = String(round)
        lblScore.text=String(score)
    }
    
    @IBAction func StartOver(){
        self.score=0
        lblScore.text="0"
        self.round=0
        lblRound.text="0"
        }
}
