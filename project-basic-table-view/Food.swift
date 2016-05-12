//
//  Food.swift
//  project-basic-table-view
//
//  Created by cheng on 2016/5/12.
//  Copyright © 2016年 reyes. All rights reserved.
//

import UIKit

class Food {
    
    enum Cooking {
        case normal
        case special
    }
    
    var cooking = Cooking.self
    var items = NSMutableArray()
    
//    回傳菜色名稱
    func CookName(cooking: Cooking) -> NSMutableArray {
        switch cooking {
        case .normal:
            self.items = ["黃金炒飯", "迷魔幻麻婆豆腐", "炒青江菜", "南鮮青椒肉絲", "畢拉夫什錦炒飯", "番茄燴炒飯", "叫化子雞"]
            return self.items
        case .special:
            self.items = ["鳳凰水晶", "紅油水餃", "冕頂餃子", "火焰鍋貼", "精神百倍麵"]
            return self.items
        }
    }
    
    init() {
    }
    
}
