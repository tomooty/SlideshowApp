//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 田尻智子 on 2017/03/25.
//  Copyright © 2017年 tomooty. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    var imagename:String = ""
    //stringは文字列・intは数字
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named:imagename)
        //

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    

    
   }







