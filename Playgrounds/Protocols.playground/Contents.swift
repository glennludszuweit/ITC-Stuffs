import UIKit

var taskList: [Int:String] = [:]

//protocol declaration
protocol QueryTasks {
    func getTask(id: Int) -> [Int: String]
    func getTasks() -> [Int:String]
}

protocol MutateTasks {
    func addtask(id: Int, task: String)
    func deleteTask(id: Int)
}

//protocol composistion
protocol TaskActions: QueryTasks, MutateTasks {}

//protocol extension
extension TaskActions {
    func addTask() {
        taskList[0] = "Wake up before your alarm!"
    }
}

//optional protocol
@objc protocol DisplayTasks {
    @objc optional func displayTasks(id: Int) -> String
}

//consuming protocol
class Task: TaskActions, DisplayTasks {
    func getTasks() -> [Int : String] {
        return taskList
    }
    
    func getTask(id: Int) -> [Int:String] {
        let task = taskList.filter({ $0.key == id })
        return task
    }
    
    func addtask(id: Int, task: String) {
        taskList[id] = task
    }
    
    func deleteTask(id: Int) {
        taskList[id] = nil
    }
    
    func displayTasks(id: Int) -> String {
        if taskList[id] != nil {
            return "\(taskList[id]!)"
        } else {
            return "Task not available"
        }
    }
}

let actions = Task()

actions.addtask(id: 9, task: "Go home.")

print(actions.displayTasks(id: 9))

for task in taskList {
    print("\(task.key) - \(task.value)")
}
