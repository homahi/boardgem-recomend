//
//  ViewModel.swift
//  BoardgameReco
//
//  Created by 原野誉大 on 2018/03/10.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct ViewModel {
    private var boardgames = Variable<[Boardgame]>([])
    var player: Variable<Int> = Variable(0)
    private let model = Model(path:"data")
    private let disposeBag = DisposeBag()
    
    init(){
        load()
        updatePlayer()
    }
    
    func load(){
        model.getBoardgames()
            .subscribe(onNext: { (b) in
                self.boardgames.value = b
            }).disposed(by: disposeBag)
    }
    
    func getBoargames() -> Variable<[Boardgame]>{
        return boardgames
    }
    func updatePlayer(){
        player.asObservable().subscribe(onNext: { num in
            self.model.setPlayer(num: num)
        })
    }


}
