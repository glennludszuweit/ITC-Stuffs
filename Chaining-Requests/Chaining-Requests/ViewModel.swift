//
//  ViewModel.swift
//  Chaining-Requests
//
//  Created by Glenn Ludszuweit on 05/06/2023.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    @Published var comments: [Comment] = []
    
    private var combineImple = CombineImpl()
    private var cancellable = Set<AnyCancellable>()
    
    func getCommentsWithCombine() {
        combineImple.getUsers().flatMap { users -> AnyPublisher<[Post], Error> in
            if let user = users.last {
                return self.combineImple.getPosts(userId: user.id ?? 1)
            } else {
                return Fail(error: ApiError.emptyUsers).eraseToAnyPublisher()
            }
        }.flatMap { posts -> AnyPublisher<[Comment], Error> in
            if let post = posts.last {
                return self.combineImple.getComments(postId: post.id ?? 1)
            } else {
                return Fail(error: ApiError.emptyPosts).eraseToAnyPublisher()
            }
        }.sink { result in
            switch result {
            case .finished:
                print("success")
            case .failure(let error):
                print(error.localizedDescription)
            }
        } receiveValue: { comments in
            DispatchQueue.main.async {
                self.comments = comments
            }
        }.store(in: &cancellable)
        
    }
}
