//
//  SignupForm.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/10/20.
//

import SwiftUI
import Alamofire

struct SignupForm: View {
    @State var username: String = ""
    
    @State private var password = ""
    @State private var confirmedPassword = ""
    
    @State var resetForm: () -> Void
    
    func requestSignUp(parameters: [String: String], completion: @escaping ((AFResult<Any>) -> Void)) {
        AF.request("https://plant-collector-api.herokuapp.com/auth/signup", method: .post, parameters: parameters, encoding: JSONEncoding.default)
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
                    }
                    
                    Section {
                        SecureField("Enter password", text: $password)
                        SecureField("Confirm Password", text: $confirmedPassword)
                    }
                    
                    Section {
                        Button(action: {
                            let parameters: [String: String] = [
                                "username" : self.username,
                                "password" : self.confirmedPassword
                            ]
                            requestSignUp(parameters: parameters) {
                                (response: AFResult<Any>) in
                                switch response {
                                        case .success:
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
                }.navigationTitle(Text("Sign up"))
            }
        }.background(Color(UIColor.systemGray6)).ignoresSafeArea()
    }
    
    private func isFormValid() -> Bool {
        if username.isEmpty {
            return true
        }
        
        if password.count < 8 || self.isPasswordValid() == false {
            return true
        }
        return false
    }
    
    private func isPasswordValid() -> Bool {
        if !confirmedPassword.isEmpty && password == confirmedPassword {
            return true
        }
        return false
    }
}

func anon() {
    print("anon")
}

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm(resetForm: anon)
    }
}
