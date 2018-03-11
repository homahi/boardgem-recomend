//
//  ModalViewController.swift
//  BoardgameReco
//
//  Created by 原野誉大 on 2018/03/11.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBAction func tapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    private let viewModel = ViewModel()
    var boardgame: Boardgame!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadImage()

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
    
    func loadImage(){
        let url = URL(string: self.boardgame.image_url)
        let imageData = try? Data(contentsOf: url!)
        self.imageView?.image = UIImage(data: imageData!)
    }

}
