//
//  GoogleSignInMethod.swift
//  FinanceFreedom
//
//  Created by Luismi on 5/29/24.
//

import Foundation
import GoogleSignIn
import GoogleSignInSwift

struct GoogleSignInResultModel {
    let idToken: String
    let accesToken: String
    let name: String?
    let email: String?
}

final class GoogleSignInMethod {
    
    func signIn() async throws -> GoogleSignInResultModel{
        guard let topVc =  await Utilities.shared.topViewController() else {
            throw URLError (.cannotFindHost)
        }
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVc)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        let name = gidSignInResult.user.profile?.name
        let email = gidSignInResult.user.profile?.email
        
        let tokens = GoogleSignInResultModel(idToken: idToken, accesToken: accessToken, name: name, email: email)
        return tokens
    }
}

