//: Playground - noun: a place where people can play

import UIKit

class Store {
    static var totalGolds = 10_000
    static func distribute(golds required: Int)->Int{
        let shoulded = min(required,totalGolds)
        totalGolds -= shoulded
        return shoulded
    }
    
    static func receive(coins:Int){
        totalGolds += coins
    }
}

class Player{
    var golds:Int
    init(golds:Int) {
        self.golds = Store.distribute(golds: golds)
    }
    func win(golds:Int)  {
        self.golds += Store.distribute(golds: golds)
    }
    deinit {
        Store.receive(coins: golds)
    }
}

var player:Player? = Player(golds: 100)

print("玩家初始化金币数为：\(player!.golds)")

print("仓库中还剩余金币数：\(Store.totalGolds)")

player!.win(golds: 2000)

print("玩家现在金币数为：\(player!.golds)")

print("仓库中还剩余金币数：\(Store.totalGolds)")

player = nil

print("仓库中现在金币数：\(Store.totalGolds)")