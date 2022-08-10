//
//  ViewController.swift
//  PasswordHacker
//
//  Created by 春田実利 on 2022/08/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
    
    @IBOutlet var countLabel: UILabel!
    
    var password = Int.random(in: 0...9999)
    
    var tapCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startButton(){
        tapCount = tapCount + 1
        
        if tapCount >= 2 {
            let alert = UIAlertController(title: "パスワードは解析済みです", message: "", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default) { (action) in
                self.dismiss(animated: true, completion: nil)
            }
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        
        print("🐶",password)
        
        for i in 0...9999 {
            countLabel.text = String(i)
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
            
            
            if i == password {
                var digits = [Int]()
                
                for _ in 0...3 {
                    digits.append(password % 10)
                    password = password / 10
                    
                }
                
                resultLabel4.text = String(digits[0])
                resultLabel3.text = String(digits[1])
                resultLabel2.text = String(digits[2])
                resultLabel1.text = String(digits[3])
                countLabel.text = "解析完了"
                
                if tapCount >= 2 {
                    countLabel.text = "Resetボタンを押してください"
                }
                
                break
            }
        }
        
    }
    
    @IBAction func resetButton(){
        tapCount = 0
        
        password = Int.random(in: 0...9999)
        countLabel.text = "スタートボタンを押して解析開始"
        
        resultLabel4.text = "0"
        resultLabel3.text = "0"
        resultLabel2.text = "0"
        resultLabel1.text = "0"
        
    }
    
}

