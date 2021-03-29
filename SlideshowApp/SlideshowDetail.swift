//
//  SlideshowDetail.swift
//  SlideshowApp
//
//  Created by PC-SYSKAI551 on 2021/03/28.
//

import UIKit

class SlideshowDetail: UIViewController {
        
    var imageView:UIImageView!
    var imageIndex:Int = 1
    var scale:CGFloat = 1.0
    var width:CGFloat = 0
    var height:CGFloat = 0
    var screenWidth:CGFloat = 0
    var screenHeight:CGFloat = 0
    
    var imageArray:[UIImage] = [
        UIImage(named: "A")!,
        UIImage(named: "B")!,
        UIImage(named: "C")!,
        UIImage(named: "D")!
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        // 画像の幅・高さの取得
        width = imageArray[imageIndex].size.width
        height = imageArray[imageIndex].size.height
        // UIImageView インスタンス生成
        imageView = UIImageView(image:imageArray[imageIndex])
        
        // 画像サイズをスクリーン幅に合わせる
        scale = screenWidth / width
        let rect:CGRect = CGRect(x:0, y:150, width:width*scale, height:height*scale)
        
        // 画像の中心をスクリーンの中心位置に設定
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        
        imageView.frame = rect;
        self.view.addSubview(imageView)

//        imageViewDetail.image = imageArray[imageIndex]

    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}
