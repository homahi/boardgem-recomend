//
//  ViewController.swift
//  BoardgameReco
//
//  Created by 原野誉大 on 2018/03/10.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var minPlayer: UITextField!
    private var disposeBag = DisposeBag()
    
    var viewModel = ViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        populateBoardgameTableView()
        setPlayer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func populateBoardgameTableView() {
        let observable = viewModel.getBoargames().asObservable()
        
        observable.bind(to: tableView.rx.items(cellIdentifier: "cell")) { (row,element, cell) in
            cell.textLabel?.text = element.name
//            let url = URL(string: element.image_url)
//            let imageData = try? Data(contentsOf: url!)
//            cell.imageView?.image = UIImage(data: imageData!)
        }
        .disposed(by: disposeBag)
    }
    
    private func setPlayer(){
        minPlayer.rx.text.asDriver().drive(onNext: { num in
            let number = Int(num!) ?? 0
            self.viewModel.player.value = number

        })
    }

}

