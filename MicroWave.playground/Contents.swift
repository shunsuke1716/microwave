import UIKit
import PlaygroundSupport

class MicroWave{
    var timer: Timer?
    var count: Int = 0
    var dish = ""
    var calorie = 0
    var heating_time = 0

        init(dish: String,calorie: Int){
        self.dish = dish
        self.calorie = calorie
    }
    @objc func countup() {
        count += 1
        print("\(count)秒です")
        if heating_time <= count {
            print("温め完了しました。")
            // タイマーを止める
            timer?.invalidate()
        }
    }
    func startButton(time: Int,dish: String,calorie: Int) -> String {
        var totalcalorie = 0
        var result = ""
        var lackcalorie = 0
        var additinal_time = 0
        totalcalorie = time*500
        
        if totalcalorie >= calorie{
            print("温め開始します。")
            heating_time = time
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self,
                selector: #selector(countup),
                userInfo: nil,
                repeats: true
            )
            result = "温め完了しました。"
        }else{
            lackcalorie = calorie-totalcalorie
            additinal_time = lackcalorie/500
            result = "\(additinal_time)[秒]を追加してください。"
        }
        return result
    }
}

let hamburger = MicroWave(dish:"Humburger" , calorie:1000)
let karaage_bento = MicroWave(dish:"KaraageBento" , calorie:1500)
let ramen = MicroWave(dish:"Ramen" , calorie:2000)

let start = hamburger.startButton(time: 2 , dish: hamburger.dish, calorie: hamburger.calorie)

print(start)
