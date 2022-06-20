//
//  ViewController.swift
//  BullsEye
//
//  Created by WEI-YI Wang on 2022/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targertValue: Int = 0
    var score = 0   //型別已經知道是Int ,不然可以用option + 點下去 scroe
    var round = 0   // Round：裏面要確認是 0 零
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    

    // 這是在ViewController 下面顯示出來的....
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targertValue = Int.random(in: 1...100)
        // 這是要去初始化上面 Var targertValue: Int = 0
        startNewGame()
        
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageNormal, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        // 做完左邊開始執行右邊
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
        
        
        
    }
    
    
    // Action area (動作反應的地方) //be careful of case-sensitivity mistakes!
    @IBAction func showAlert() {
        
        // 用演算法 Algorithm
        // 絕緣負數變成正數
        var different = abs(targertValue - currentValue)
        // 固定值給獎勵.要馬100 ,要馬就是 0
        var points = 100 - different // 要更動給獎勵...就要變Var
        
        //score = score + points
        score += points //專業點...
        
        let title: String
        if different == 0 {
            title = "Perfect"
            points += 100 // Perfect 給多100點的獎勵
        } else if different < 5 {
            title = "You almost had it."
            points += 50 // You almost had it 給多50點的獎勵
        } else if different < 10 {
            title = "Pretty good!!!"
        } else {
            title = "Not even close....hurry"
        }
        
        
        
//        // 用演算法 Algorithm
//        var different  = currentValue - targertValue
//        if different < 0 {
////            different = different * -1
////            different *= -1
////            different = -different
//        }
        
        
        
        
//        var different: Int  // 設常數
//        // if statement 基本的算數
//        if currentValue > targertValue {                // 如果是
//            different = currentValue - targertValue
//        } else if targertValue > currentValue{          // 那就是
//            different = targertValue - currentValue
//        } else {                                        //兩著都不是....
//            different = 0
//        }
        
        
        let message = "you scored \(points) points"
        
//        let message = "The value of the slider is now: \(currentValue)" +
//        "\n The target value is: \(targertValue)" +
//        "\n The different is: \(different)"    // 『\n』跳下一行的意思
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ok", style: .default, handler: {
            action in self.startNewRound()
        })
        
        //要把動作和警示連再一起
        alert.addAction(action)
        
        //讓他出現的方式
        present(alert, animated: true, completion: nil)
        
     
        
    }
    // Make a function as Slider (_ 這邊要加入底線 Variable => Var) inside type (UISlider) -> 表示 Slider 單獨功能要動起來
    @IBAction func sliderMoved(_ slider:UISlider){
        print("The value of the slider is now: \(slider.value)")
        // 宣告一個常數 固定
        let roundedValue = slider.value.rounded()
        // 宣告好一個常數後,測試一下 看有沒有四捨五入
        print("The roundedValue of the slider is now: \(roundedValue)")
        
        currentValue = Int(roundedValue)
    }
    // 做一個Functionality as startNewRound（功能）
    func startNewRound() {
        // 當你按startNewRound的時候就要往上加一次 ....
        round += 1
        let targertValue = Int.random(in: 1...100)
        // 要知道他在的位置,每次按下去的時候換的位置
        currentValue = 50
        // casting 的轉換
        slider.value = Float(currentValue)
        updateLabels()
    }
    func updateLabels() {   // interget converts to string
        targetLabel.text = String(targertValue)
        scoreLabel.text = String(score) //轉換型別
        roundLabel.text = String(round)
    }
    // 要產生動作
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
    }
    
    
}



