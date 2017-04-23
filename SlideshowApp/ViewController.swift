//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 田尻智子 on 2017/03/25.
//  Copyright © 2017年 tomooty. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    @IBOutlet weak var startstopbutton: UIButton!
    
    @IBOutlet weak var nextbutton: UIButton!
    
    @IBOutlet weak var backbutton: UIButton!
    
    
    
    @IBAction func onTapimage(_ sender: Any) {
        performSegue(withIdentifier: "result", sender: nil)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.imagename = imagenames[imagenumber]
        //進むボタンや戻るボタンのコロコロ変わる配列のimagenamesの画像名を渡している。
//        self.timer?.invalidate()   // 現在のタイマーを破棄する
//        self.timer = nil
        
        
    
    }
    //prepareとはUIStoryboardSegueの矢印の先
    
    let imagenames = ["IMG_1864.jpg","IMG_1865.JPG","IMG_1867.jpg","IMG_1868.jpg"]
    //　画像を全部入れた
    var imagenumber = 0
    //　１枚目を０とした
    var timer: Timer?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    imageView.image = UIImage(named:imagenames[imagenumber])
        // 画像の名前の配列の番号をimagenumberとした
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    
    
    @IBAction func next(_ sender: Any) {
     imagenumber+=1
        // 画像を１枚づつ進める
        if imagenames.count-1 < imagenumber{
            imagenumber = 0
            // もし４枚目の画像よりcountが大きくなったら１枚目に戻す命令
        }
      imageView.image = UIImage(named:imagenames[imagenumber])
        
    }

    @IBAction func back(_ sender: Any) {
        imagenumber-=1
        // 画像を１枚ずつ戻る
        if imagenumber < 0 {
            imagenumber = imagenames.count-1
            // 画像が１枚目よりcountが少なくなったらimagename.count=4枚目の前の１枚に戻る命令
        }
        imageView.image = UIImage(named:imagenames[imagenumber])

    }
    
    func updateTimer(timer: Timer){
        imagenumber+=1
        // 画像を１枚づつ進める
        if imagenames.count-1 < imagenumber {
            imagenumber = 0
            // もし４枚目の画像よりcountが大きくなったら１枚目に戻す命令
        }
        imageView.image = UIImage(named:imagenames[imagenumber])
    
        
    }
    
    @IBAction func startstop(_ sender: Any) {
        
 
        if self.timer == nil {
            
            //self.timerがnilならば作ってあげる
            
            self.startstopbutton.setTitle("停止", for: .normal)
            //ボタンのタイトルを変える命令
            self.nextbutton.isEnabled = false
            //isEnablesほとんどのUIに対してfalse停止
            self.backbutton.isEnabled = false
    
           self.timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            

        }else{
            //selt.timerがnilではないならば、（何か入っているなら）self.timerを破棄する
            //elseはif条件式の逆の条件
            self.timer?.invalidate()   // 現在のタイマーを破棄する
            self.startstopbutton.setTitle("再生", for: .normal)
            //ボタンのタイトルを変える命令
            
        
            self.timer = nil
            self.nextbutton.isEnabled = true
            //isEnablesほとんどのUIに対してtrue再生
            self.backbutton.isEnabled = true
            
            
        }
        
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        //Resultview画面から戻ってきた時の命令
//        self.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

        
        
}

        

    


