import UIKit

// 1. userInteractive
DispatchQueue.global(qos: .userInteractive).async {
    print("Priority for animation and user related job, updating the ui")
}

// 2. userInitiated
DispatchQueue.global(qos: .userInitiated).async {
    print("When user requires immediate data, good for fetching api on pagination")
}

// 3. utility
DispatchQueue.global(qos: .utility).async {
    print("Good for performing long running operations, like downloading images or videos.")
}

// 4. background
DispatchQueue.global(qos: .background).async {
    print("Perform long running task in the background, like scheduled tasks or retoring database data.")
}

// 5.
DispatchQueue.global(qos: .unspecified).async {
    print("The least prioritized queue.")
}

// 6. default
DispatchQueue.global().async {
    print("Falls between userInitiated and utility tasks.")
}
