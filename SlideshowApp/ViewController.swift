//
//  ViewController.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI551 on 2021/03/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var slideimage: UIImageView!
    
    // スライドショーに使用するインデックスを宣言
     var nowIndex:Int = 0
     
    // スライドショーに使用するタイマーを宣言
     var timer: Timer!
     
     // スライドショーさせる画像の配列を宣言
     var imageArray:[UIImage] = [
         UIImage(named: "A")!,
         UIImage(named: "B")!,
         UIImage(named: "C")!
     ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // 画像を切り替えるセクション
      @objc func changeImage() {
          // indexを増やして表示する画像を切り替える
          nowIndex += 1
          
          // indexが表示予定の画像の数と同じ場合
          if (nowIndex == imageArray.count) {
              // indexを一番最初の数字に戻す
              nowIndex = 0
          }
          // indexの画像をstoryboardの画像にセットする
          slideimage.image = imageArray[nowIndex]
    }
    @IBAction func nextButton(_ sender: Any) {
        nowIndex += 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.count) {
            // indexを一番最初の数字に戻す
            nowIndex = 0
        }
        // indexの画像をstoryboardの画像にセットする
        slideimage.image = imageArray[nowIndex]
        
    }
    @IBAction func backButton(_ sender: Any) {
        // 最初にボタンを押されたら
        if (nowIndex == 0){
            nowIndex = imageArray.endIndex
        }
        nowIndex -= 1
        
        // indexが表示予定の画像の数と同じ場合
        if (nowIndex == imageArray.endIndex) {
            // indexを最後の数字に戻す
            nowIndex = imageArray.endIndex
        }
        // indexの画像をstoryboardの画像にセットする
        slideimage.image = imageArray[nowIndex]

    }
    @IBAction func runstopButton(_ sender: AnyObject) {
        // 再生中か停止しているかを判定
         if (timer == nil) {
            // タイマーをセットする
             timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
         } else {
             // タイマーを停止する
             timer.invalidate()
             // タイマーを削除しておく(timer.invalidateだけだとtimerがnilにならないため)
             timer = nil
         }
            if ( timer == nil ) {
                nextButton.isEnable = false
                backButton.isEnable = false }
            else {
                nextButton.isEnable = true
                backButton.isEnable = true
            }
     }
    @IBAction func onTapImage(_ sender: AnyObject) {
        // セグエを使用して画面を遷移
        performSegue(withIdentifier: "result", sender: nil)
    }
}
