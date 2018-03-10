//
//  Model.swift
//  BoardgameRecomend
//
//  Created by 原野誉大 on 2018/03/10.
//  Copyright © 2018年 原野誉大. All rights reserved.
//

import Foundation
import RxSwift

struct Model {
    
    private var boardgamesFromCsv : [Boardgame] = []
    private var boardgames = Variable<[Boardgame]>([])
    let path: String!
    
    init(path: String){
        self.path = path
        load()
    }
    
    func getBoardgames() -> Observable<[Boardgame]> {
        return boardgames.asObservable()
    }
    
    mutating func load() -> Void{
        
        guard  let csvBundle = Bundle.main.path(forResource: path, ofType: "csv") else {
            fatalError("読み込みミス")
        }
        
        let csvString: String = try! String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
        let csvArray = csvString.components(separatedBy: "\n")
        for line in csvArray {
            if line.count == 0 {
                continue
            }
            let parts = line.components(separatedBy: ",")
            let boardgame = Boardgame(name: parts[0], minPlayers: Int(parts[1])!, maxPlayers: Int(parts[2])!, playingTime: Int(parts[3])!, image_url: parts[4])
            boardgamesFromCsv.append(boardgame)
        }
        boardgames.value = boardgamesFromCsv
    }
    
    func setPlayer(num: Int) -> Void{
        if num != 0 {
            boardgames.value = boardgamesFromCsv.filter({ (boardgame) -> Bool in
                return boardgame.minPlayers <= num && boardgame.maxPlayers >= num
            })
        } else {
            boardgames.value = boardgamesFromCsv
        }
    }
}

struct Boardgame {
    let name: String
    let minPlayers: Int
    let maxPlayers: Int
    let playingTime: Int
    let image_url: String
}

