//
//  FireStoreWorker.swift
//  ToDoApp
//
//  Created by Razee Hussein-Jamal on 8/8/20.
//  Copyright © 2020 Razee Hussein-Jamal. All rights reserved.
//

import FirebaseFirestore
import Firebase
import FirebaseFirestoreSwift

protocol FirestoreProtocol {
    func fetch(collection: CollectionType, completion: @escaping (Result<[QueryDocumentSnapshot],Error>)-> Void)
    func create<T: Codable>(data: T, collection: CollectionType, completion: @escaping(Result<T,Error>) -> Void)
    func update<T: Codable>(with id: String, field: String, value: T, collection: CollectionType, completion: @escaping (Result<String,Error>) -> Void)
}

class FirestoreWorker: FirestoreProtocol {
    let db: Firestore
    
    init(db: Firestore = Firestore.firestore()) {
        self.db = db
    }
    
    func fetch(collection: CollectionType, completion: @escaping (Result<[QueryDocumentSnapshot],Error>) -> Void) {
        _ = db.collection(collection.rawValue).getDocuments { (querySnapshot, error) in
            if let error = error {
                completion(Result.failure(error))
            }
            else {
                guard let results = querySnapshot?.documents else {
                    return
                }
                
                if results.isEmpty {
                    completion(Result.failure(AppError.networkError()))
                } else {
                    completion(Result.success(results))
                }
            }
        }
    }
    
    func create<T: Codable>(data: T, collection: CollectionType, completion: @escaping(Result<T,Error>) -> Void) {
        do {
            _ = try db.collection(collection.rawValue).addDocument(from: data)
            completion(Result.success(data))
        }
        catch {
            completion(Result.failure(error))
        }
    }
    
    func update<T: Codable>(with id: String, field: String, value: T, collection: CollectionType, completion: @escaping (Result<String,Error>) -> Void) {
        
        let documentRef = db.collection(collection.rawValue).document(id)
        documentRef.updateData([
            field: value
        ]) { error in
            if let error = error {
                completion(Result.failure(error))
            } else {
                completion(Result.success(documentRef.documentID))
            }
        }
    }
}

