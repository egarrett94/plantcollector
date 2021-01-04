//
//  Welcome.swift
//  PlantCollector
//
//  Created by Lemon Garrett on 12/29/20.
//

import SwiftUI

enum FormType : String {
    case signup = "signup"
    case login = "login"
}

struct Welcome: View {
    @State var formType: FormType? = nil
    
    func resetForm() {
        formType = nil
    }
    
    var body: some View {
        switch formType{
            case .signup:
                SignupForm(resetForm: resetForm)
            case .login:
                LoginForm(resetForm: resetForm)
            default:
                VStack{
                    VStack {
                        Image(systemName: "leaf").font(.system(size: 60.0, weight: .bold)).foregroundColor(ColorManager.background)
                        Text("plants")
                            .font(Font.largeTitle).foregroundColor(ColorManager.background).bold().padding(.bottom, 25)
                        Button(action: {
                            withAnimation {
                                self.formType = .signup
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(ColorManager.background)
                                Text("Sign up").foregroundColor(Color.white).padding(10)
                            }
                            .frame(width: 100, height: 50)
                            .padding(.bottom, 10)
                        }.accessibility(label: Text("Sign up"))
                        
                        Button(action: {
                            withAnimation {
                                self.formType = .login
                            }
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(ColorManager.background)
                                Text("Log in").foregroundColor(Color.white).padding(10)
                            }
                            .frame(width: 100, height: 50)
                        }.accessibility(label: Text("Sign up"))
                    }.padding(.all, 30)
                }.frame(minWidth: 200).background(Color.white).ignoresSafeArea()
        }
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}
