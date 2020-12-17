//
//  SignupForm.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/10/20.
//

import SwiftUI

struct SignupForm: View {
    @State var username: String = ""
    
    @State private var password = ""
    @State private var confirmedPassword = ""

    @State private var keyboardOffset: CGFloat = 0
    
    var body: some View {
        VStack {
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
                            // put network call to http:// the api /login
                            print("Submitted \($username) \($password)")
                        }) {
                            Text("Submit")
                        }.disabled(self.isFormValid())
                    }
                }.navigationTitle(Text("Sign up"))
            }.offset(y: -self.keyboardOffset)
        }.background(Color(UIColor.systemGray6))

        .onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) {
                notification in
                    NotificationCenter.default.addObserver(
                        forName: UIResponder.keyboardDidShowNotification,
                        object: nil,
                        queue: .main) {
                        
                        notification in
                            guard let userInfo = notification.userInfo,
                                let keyboardRect = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                            
                            self.keyboardOffset = keyboardRect.height
                    }
                    
                    NotificationCenter.default.addObserver(
                        forName: UIResponder.keyboardDidHideNotification,
                        object: nil,
                        queue: .main) { (notification) in
                            self.keyboardOffset = 0
                    }
            }
        }
        
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

struct SignupForm_Previews: PreviewProvider {
    static var previews: some View {
        SignupForm()
    }
}
