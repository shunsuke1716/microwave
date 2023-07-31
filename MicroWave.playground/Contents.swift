import Foundation


class MicroWave{
    
    var dish = ""
    var calorie = 0
    var totalcalorie = 0
    var time = 0
    var Wattage = 0
    var result = ""
    var lackcalorie = 0
    init(dish:String,calorie:Int){
        self.dish = dish
        self.calorie = calorie
    }
    func startButton(time:Int,Wattage:Int,dish:String,calorie:Int) -> String {
        totalcalorie = time*Wattage
        if totalcalorie>=calorie{
            result = "温め完了しました。"
        }else{
            lackcalorie = calorie-totalcalorie
            result = "\(lackcalorie)[cal]を追加してください。"
        }
        return result
    }
}

let hamburger = MicroWave(dish:"Humburger" , calorie:500*60)
let karaage_bento = MicroWave(dish:"KaraageBento" , calorie:500*130)
let ramen = MicroWave(dish:"Ramen" , calorie:1500*140)

let start = hamburger.startButton(time: 60, Wattage: 500, dish: hamburger.dish, calorie: hamburger.calorie)

print(start)
