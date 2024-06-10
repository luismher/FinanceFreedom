//
//  AuthenticationManager.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/27/24.
//

import Foundation
import FirebaseAuth

struct AuthDataResultModel {
    let uid: String
    let name: String?
    let email: String?
    let photoUrl: String?
    let isAnonymus: Bool
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.name = user.displayName
        self.photoUrl = user.photoURL?.absoluteString
        self.isAnonymus = user.isAnonymous
    }
}

enum AuthProviderOption: String  {
    case email = "password"
    case google = "google.com"
    case apple = "apple.com"
}

final class AuthenticationManager{
    
    static let shared = AuthenticationManager()
    private init(){ }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel   {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel (user: user)
    }
    
    func getProvider() throws -> [AuthProviderOption ] {
        guard let providerData  = Auth.auth().currentUser?.providerData else {
            throw URLError(.badServerResponse)
        }
        var providers: [AuthProviderOption] = []
        for provider in providerData {
            if let option = AuthProviderOption(rawValue: provider.providerID){
                providers.append(option)
            } else {
                assertionFailure("Provider option not found: \(provider.providerID)")
            }
        }
        return providers
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
}

// SignIn with Email
extension AuthenticationManager{
    @discardableResult
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthDataResultModel (user: authDataResult.user)
    }
    
    @discardableResult
    func signIn(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthDataResultModel(user: authDataResult.user)

    }
    
    func resetPassword(email: String) async throws {
       try await  Auth.auth().sendPasswordReset(withEmail: email)
    }
    func updatePassword(password: String) async throws {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
       try await  user.updatePassword(to: password)
    }
}

//SignIn SSO
extension AuthenticationManager{
    
    @discardableResult
    func signInWithGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.idToken )
        return try await signInWithCredential(credential: credential)
    }

    @discardableResult
    func signInWithApple(tokens: SignInWithAppleResult) async throws -> AuthDataResultModel {
        let credential = OAuthProvider.credential(withProviderID: AuthProviderOption.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce)
        return try await signInWithCredential(credential: credential)
    }
    
    func signInWithCredential(credential: AuthCredential) async throws -> AuthDataResultModel {
        let authDataResult =  try await Auth.auth().signIn(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }

}
// SignIn Anonymus

extension AuthenticationManager {
    
    @discardableResult
    func signInAnonymus() async throws -> AuthDataResultModel {
        let authDataResult =  try await Auth.auth().signInAnonymously()
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func linkEmail(email: String, password: String) async throws -> AuthDataResultModel {
        let credential = EmailAuthProvider.credential(withEmail: email, password: password)
        return try await linkCredential(credential: credential)
    }
 
    func linkApple(tokens: SignInWithAppleResult) async throws -> AuthDataResultModel {
        let credential = OAuthProvider .credential(withProviderID: AuthProviderOption.apple.rawValue, idToken: tokens.token, rawNonce: tokens.nonce )
        return try await linkCredential(credential: credential)
    }
    
    func linkGoogle(tokens: GoogleSignInResultModel) async throws -> AuthDataResultModel {
        let credential = GoogleAuthProvider.credential(withIDToken: tokens.idToken, accessToken: tokens.idToken )
        return try await linkCredential(credential: credential)
    }
    private func linkCredential(credential: AuthCredential) async throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badURL)
        }
        let authDataResult = try await user.link(with: credential)
        return AuthDataResultModel(user: authDataResult.user)
    }
}
