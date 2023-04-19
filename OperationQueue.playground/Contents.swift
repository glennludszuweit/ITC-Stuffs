import UIKit

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
}

struct User: Codable {
    let id: Int
    let name: String
    let email: String
}

let operation1 = BlockOperation {
    print("Priority for animation and user related job, updating the ui.")
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let jsonData = try JSONDecoder().decode([Post].self, from: data)
            jsonData.map { post in
                print(post.title.capitalized)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    .resume()
}

let operation2 = BlockOperation {
    print("Priority for animation and user related job, updating the ui.")
    let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let jsonData = try JSONDecoder().decode([User].self, from: data)
            jsonData.map { user in
                print(user.name)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    .resume()
}


let operationQueue = OperationQueue()

operation2.addDependency(operation1)
operationQueue.maxConcurrentOperationCount = 2
operationQueue.addOperations([operation1, operation2], waitUntilFinished: false)

