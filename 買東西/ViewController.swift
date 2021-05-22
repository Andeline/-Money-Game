//
//  ViewController.swift
//  買東西
//
//  Created by 蔡佳穎 on 2021/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commodityLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    
    @IBOutlet weak var thousandStepper: UIStepper!
    @IBOutlet weak var fiveHundredStepper: UIStepper!
    @IBOutlet weak var oneHundredStepper: UIStepper!
    @IBOutlet weak var fiftyStepper: UIStepper!
    @IBOutlet weak var tenStepper: UIStepper!
    @IBOutlet weak var fiveStepper: UIStepper!
    @IBOutlet weak var oneStepper: UIStepper!
    
    @IBOutlet weak var thousandLabel: UILabel!
    @IBOutlet weak var fiveHundredLabel: UILabel!
    @IBOutlet weak var oneHundredLabel: UILabel!
    @IBOutlet weak var fiftyLabel: UILabel!
    @IBOutlet weak var tenLabel: UILabel!
    @IBOutlet weak var fiveLabel: UILabel!
    @IBOutlet weak var oneLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var commodities = [Commodity]()
    var thousand = 0
    var fiveHundred = 0
    var oneHundred = 0
    var fifty = 0
    var ten = 0
    var five = 0
    var one = 0
    var total = 0
    var answer = 1298
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commodity1 = Commodity(name: "花雕酸菜牛肉麵", price: 1298, imageName: "泡麵.jpeg")
        commodities.append(commodity1)
        let commodity2 = Commodity(name: "醫療口罩", price: 2599, imageName: "口罩.jpeg")
        commodities.append(commodity2)
        let commodity3 = Commodity(name: "白蘭漂白水", price: 655, imageName: "漂白水.jpeg")
        commodities.append(commodity3)
        let commodity4 = Commodity(name: "酒精噴霧消毒器", price: 3780, imageName: "酒精.jpeg")
        commodities.append(commodity4)
        
        resultLabel.text = ""
    }
    
    func clear() {
        thousand = 0
        fiveHundred = 0
        oneHundred = 0
        fifty = 0
        ten = 0
        five = 0
        one = 0
        total = 0
        
        thousandStepper.value = 0
        fiveHundredStepper.value = 0
        oneHundredStepper.value = 0
        fiftyStepper.value = 0
        tenStepper.value = 0
        fiveStepper.value = 0
        oneStepper.value = 0
        
        thousandLabel.text = "\(thousandStepper.value)"
        fiveHundredLabel.text = "\(fiveHundredStepper.value)"
        oneHundredLabel.text = "\(oneHundredStepper.value)"
        fiftyLabel.text = "\(fiftyStepper.value)"
        tenLabel.text = "\(tenStepper.value)"
        fiveLabel.text = "\(fiveStepper.value)"
        oneLabel.text = "\(oneStepper.value)"
        
        totalLabel.text = "總額：\(total)"
        resultLabel.text = ""
    }

    @IBAction func changeCommodity(_ sender: UIButton) {
        clear()
        
        imageView.image = UIImage(named: commodities[sender.tag].imageName)
        commodityLabel.text = commodities[sender.tag].name
        priceLabel.text = "\(commodities[sender.tag].price)"
        answer = commodities[sender.tag].price
    }
    
    @IBAction func changeStepper(_ sender: UIStepper) {
        
        thousandLabel.text = "\(thousandStepper.value)"
        fiveHundredLabel.text = "\(fiveHundredStepper.value)"
        oneHundredLabel.text = "\(oneHundredStepper.value)"
        fiftyLabel.text = "\(fiftyStepper.value)"
        tenLabel.text = "\(tenStepper.value)"
        fiveLabel.text = "\(fiveStepper.value)"
        oneLabel.text = "\(oneStepper.value)"
        
        thousand = Int(thousandStepper.value) * 1000
        fiveHundred = Int(fiveHundredStepper.value) * 500
        oneHundred = Int(oneHundredStepper.value) * 100
        fifty = Int(fiftyStepper.value) * 50
        ten = Int(tenStepper.value) * 10
        five = Int(fiveStepper.value) * 5
        one = Int(oneStepper.value) * 1
        
        total = thousand + fiveHundred + oneHundred + fifty + ten + five + one
        
    }
    
    @IBAction func buy(_ sender: UIButton) {
        
        totalLabel.text = "總額：\(total)"
        totalLabel.sizeToFit()
        
        if total == answer {
            resultLabel.text = "購買成功"
            resultLabel.sizeToFit()
        } else if total > answer {
            resultLabel.text = "多了\(total-answer)"
            resultLabel.sizeToFit()
        } else {
            resultLabel.text = "少了\(answer-total)"
            resultLabel.sizeToFit()
        }
    }
    
    @IBAction func clear(_ sender: UIButton) {
        clear()
    }
}

