//
//  SignupForm.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/10/20.
//

import SwiftUI
import Alamofire

struct LoginForm: View {
    @State var username: String = ""
    
    @State private var password = ""
    
    var resetForm: () -> Void
    
    func requestLogIn(parameters: [String: String], completion: @escaping ((AFResult<Any>) -> Void)) {
        AF.request("https://plant-collector-api.herokuapp.com/auth/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .responseString { response in
                    switch response.result {
                            case .success:
                            print("succESSSSSSSSSSSSSSSSSSS")
                            print(response)
                            // bop user to next screen
                            break

                            case .failure(let error):
                            print(error)
                    }
               }
    }
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    withAnimation {
                        resetForm()
                    }
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor.systemGray6))
                        Text("<< Back").foregroundColor(ColorManager.secondaryFont).padding(10)
                    }
                    .frame(width: 100, height: 50).padding(.top, 20)
                }.accessibility(label: Text("Go back"))
                Spacer()
            }
            
            NavigationView {
                Form {
                    Section(header: Text("Your Details")) {
                        TextField("Username", text: $username).autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/).disableAutocorrection(true)
                        SecureField("Enter password", text: $password)
                    }
                    
                    Section {
                        Button(action: {
                            let parameters: [String: String] = [
                                "username" : self.username,
                                "password" : self.password
                            ]
                            requestLogIn(parameters: parameters) {
                                (response: AFResult<Any>) in
                                switch response {
                                        case .success:
                                        print("succESSSSSSSSSSSSSSSSSSS")
                                        print(response)
                                        break

                                        case .failure(let error):
                                         print(error)
                                }
                            }
                        }) {
                            Text("Submit")
                        }.disabled(self.isFormValid())
                    }
                }.navigationTitle(Text("Log in"))
            }
        }.background(Color(UIColor.systemGray6)).ignoresSafeArea()
    }
    
    private func isFormValid() -> Bool {
        if username.isEmpty {
            return true
        }
        
        if password.count < 8 {
            return true
        }
        return false
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(resetForm: anon)
    }
}
