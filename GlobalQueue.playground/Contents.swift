import UIKit

struct Post: Codable {
    let id: Int
    let title: String
    let body: String
}

// 1. userInteractive
DispatchQueue.global(qos: .userInteractive).async {
    print("Priority for animation and user related job, updating the ui.")
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let jsonData = try JSONDecoder().decode([Post].self, from: data)
            print(jsonData.count)
        } catch {
            print(error.localizedDescription)
        }
    }
    .resume()
}

// 2. userInitiated
DispatchQueue.global(qos: .userInitiated).async {
    print("When user requires immediate data, good for fetching api on pagination.")
    let apiUrl = "https://jsonplaceholder.typicode.com/posts?_page="
    for page in 1...5 {
        guard let url = URL(string: "\(apiUrl)\(page)") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let jsonData = try JSONDecoder().decode([Post].self, from: data)
                print("Page \(page): \(jsonData.count) items.")
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }
}

// 3. utility
DispatchQueue.global(qos: .utility).async {
    print("Good for performing long running operations, like downloading images or videos.")
    let url = URL(string: "https://via.placeholder.com/150")!
    do {
        let imageData = try Data(contentsOf: url)
        guard let image = UIImage(data: imageData) else { return }
        print("This image size is \(image.size)")
    } catch {
        print(error.localizedDescription)
    }
}

// 4. background
DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + 30, execute: DispatchWorkItem {
    print("Perform long running task in the background, like scheduled tasks or retoring database data.")
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        do {
            let jsonData = try JSONDecoder().decode([Post].self, from: data)
            print("Background data: \(jsonData.count) items.")
        } catch {
            print(error.localizedDescription)
        }
    }
    .resume()
})

// 5.
DispatchQueue.global(qos: .unspecified).async {
    print("The least prioritized queue.")
}

// 6. default
DispatchQueue.global().async {
    print("Falls between userInitiated and utility tasks.")
}
