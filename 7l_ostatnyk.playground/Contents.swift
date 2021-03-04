import UIKit

enum GameErrors : Error {
    case notSuchItems
    case notEnoughtWood(needed: Int)
    case notEmployees(needed: Int)
    case notSuchLevel
    
    var description: String {
        switch self {
        case .notSuchItems:
            return "Ошибка! Нет таких строений для этой рассы"
        case .notEnoughtWood(needed: let value):
            return "Ошибка! Для строительства необходимо ещё \(value) ресурсов"
        case .notEmployees(needed: let value):
            return "Ошибка! Не хватает рабочих. Необходимо ещё \(value) юнитов"
        case .notSuchLevel:
            return "Ошибка! На этом уровне это строение не доступно"
        }
    }
}

struct GameItem {
    let name : String
    let wood : Int
    let employees : Int
    let level : Int
}

class MyGame {
    
    var gameItems = [
        "Base" : GameItem(name: "База", wood: 20, employees: 5, level: 1),
        "House" : GameItem(name: "Жилище", wood: 7, employees: 2, level: 1),
        "Tower" : GameItem(name: "Башня", wood: 5, employees: 3, level: 2),
        "Barracs" : GameItem(name: "Казармы", wood: 10, employees: 6, level: 2),
        "Invertory" : GameItem(name: "Мастерская", wood: 12, employees: 4, level: 3)
    ]
    
    var userWood = 17
    var userEmployees = 5
    var userLevel = 2
    
    func builtItem(itemName name : String) -> (item : GameItem?, error : GameErrors?) {
        
        guard let userItem = gameItems[name] else {
            return (nil, .notSuchItems)
        }
        guard userWood >= userItem.wood else {
            return (nil, .notEnoughtWood(needed: userItem.wood - userWood))
        }
        
        guard userEmployees >= userItem.employees else {
            return (nil, .notEmployees(needed: userItem.employees - userEmployees))
        }
        guard userLevel >= userItem.level else {
            return (nil, .notSuchLevel)
        }
        
        userWood -= userItem.wood
        return (userItem, nil)
    }
}

let userGame = MyGame()

let item1 = userGame.builtItem(itemName: "Base")
let item2 = userGame.builtItem(itemName: "Tower")
let item3 = userGame.builtItem(itemName: "Palisade")

if let item = item1.item {
    print("Вы построили: \(item.name)")
} else if let error = item1.error {
    print(error.description)
}

if let item = item2.item {
    print("Вы построили: \(item.name)")
} else if let error = item2.error {
    print(error.description)
}

if let item = item3.item {
    print("Вы построили: \(item.name)")
} else if let error = item3.error {
    print(error.description)
}

extension MyGame {
    
    func buitSafeItem(itemName name : String) throws -> GameItem {
        
        guard let userItem = gameItems[name] else {
            throw GameErrors.notSuchItems
        }
        guard userWood >= userItem.wood else {
            throw GameErrors.notEnoughtWood(needed: userItem.wood - userWood)
        }
        
        guard userEmployees >= userItem.employees else {
            throw GameErrors.notEmployees(needed: userItem.employees - userEmployees)
        }
        guard userLevel >= userItem.level else {
            throw GameErrors.notSuchLevel
        }
        
        userWood -= userItem.wood
        return userItem
    }
}

do {
    let item = try userGame.buitSafeItem(itemName: "House")
    print("Вы построили: \(item.name)")
} catch let error as GameErrors {
    print(error.description)
}

userGame.userWood = 10

// после catch сознательно обощил все ошибки в одно правило, в первой редакции обрабатывал каждую ошибку отдельно, но с учетом одного лишь print решил сократить текст кода

do {
    let item = try userGame.buitSafeItem(itemName: "Barracs")
    print("Вы построили: \(item.name)")
} catch let error as GameErrors {
    print(error.description)
}

do {
    let item = try userGame.buitSafeItem(itemName: "Invertory")
    print("Вы построили: \(item.name)")
} catch let error as GameErrors {
    print(error.description)
}
