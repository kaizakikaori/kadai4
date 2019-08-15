//
//  ViewController.swift
//  URANAI
//
//  Created by VERTEX21 on 2019/08/16.
//  Copyright © 2019 k-kougi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // 紐付け
    // 誕生日を入力するPickerViewを紐付け
    @IBOutlet weak var birthDayPicker: UIDatePicker!
    var sliderNum: Int = 50
    
    // 血液型を選択するSegmentControllを紐付け
    @IBOutlet weak var bloodType: UISegmentedControl!
    
    // Sliderから好きな数字を選ぶとSliderの下のラベルに数字が反映される
    @IBAction func likeNum(_ sender: UISlider) {
        // 下のラベル(showNum)に文字を反映させる処理を書く
        // sender.valueの初期値はDouble型なのでInt型へキャストする
        sliderNum = Int(sender.value)
        // textに代入するためにSrting型にキャストする
        showNum.text = String(sliderNum)
    }
    
    // Sliderで選んだ数字を表示させるラベルを紐付け
    @IBOutlet weak var showNum: UILabel!
    // 占い結果を表示するTextViewの紐付け
    @IBOutlet weak var result: UITextView!
    
    // 変数、定数など
    //  各選択肢の占い結果を配列で定義
    // 誕生日の選択結果
    let pickerResult : [String] = [
        "あなたは山に愛されています。\n",
        "あなたは海に愛されています。\n",
        "あなたは川に愛されています。\n",
        "あなたは森に愛されています。\n"
    ]
    
    // 血液型の選択結果
    let bloodResult : [String] = [
        "属性は「雷」です。\n",
        "属性は「水」です。\n",
        "属性は「風」です。\n",
        "属性は「草」です。\n"
    ]
    
    // 好きな数字の選択結果
    let likeNumResult: [String] = [
        "努力が報われなかったときは、「自分へのごほうび」とつぶやきながら、ひと口サイズのスイーツを口にして。",
        "探し物を思い浮かべながら、人差し指を7回反時計回りにまわしてみて。",
        "銀製品や銀のアクセサリーをピカピカに磨いてから、バッグに入れたり身につけて。",
        "ふと口をついて出た曲をダウンロードするか、ラジオ番組にリクエストメールを出しましょう。",
    ]
    
    // 関数など
    // 画面が読み込まれたときの処理
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // birthDayPickerViewの選択結果を、占い結果を決めるkeyに変換し、戻り値で取得する(returnするので、戻り値の型指定も忘れないこと!!)
    
    func setPicker() -> Int {
        // まず、birthDayPickerViewの全てのデータを格納する(PickerViewの紐付け時に型をUIDatePicker!にすること)
        let date = birthDayPicker.date
        
        // calandar.componentで上記で定義した定数dateから必要なデータ(年・月・日)を取り出す
        let year = birthDayPicker.calendar.component(.year, from: date)
        let month = birthDayPicker.calendar.component(.month, from: date)
        let day = birthDayPicker.calendar.component(.day, from: date)
        
        // 占い結果(に使うため、4で割った余りを定数に格納(4パターンある)
        let key: Int = (year + month + day) % 4
        return key
    }
    
    // bloodTypeの選択の選択結果を、占い結果を決めるkeyに変換し、戻り値で取得する
    func setBlood() -> Int {
        
        // 占い結果に使うため、bloodTypeのセグメントで選択されたインデックスを取得し、定数に格納(4パターンある)
        let Key: Int = bloodType.selectedSegmentIndex
        return Key
    }
    
    // Sliderから選んだ数字の選択結果を、占い結果を決めるkeyに変換し、戻り値で取得する
    func setLikeNum() -> Int {
        
        let Key: Int = sliderNum % 4
        
        return Key
    }
    
    //「占うボタン」をおしたとき、占い結果を最下部のtextView(result)に表示する
    @IBAction func finalResult(_ sender: Any) {
        result.text = pickerResult[setPicker()] + bloodResult[setBlood()] + likeNumResult[setLikeNum()]
    }
}

