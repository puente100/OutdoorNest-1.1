//
//  LoginView.swift
//  OutdoorNest
//
//  Created by Daniel Puente on 1/15/24.
//

import SwiftUI

struct LoginView: View {
    @Binding var back: Bool
    @State var user = ""
    @State var password = ""
    @State var launch = false
   
    var body: some View {
        

            ZStack {
               
                VStack(alignment: .leading) {
                    Image("LogoOutdoorNest")
                        .resizable()
                        .scaledToFit()
                        .modifier(OpenAnimation(launch: $launch, step: 1, totalSteps: 6))
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)

                    Text("Username")
                        .font(.headline)
                        .modifier(OpenAnimation(launch: $launch, step: 2, totalSteps: 6))

                    TextField("Enter username", text: $user)
                        .modifier(TextFieldUserName())
                        .modifier(OpenAnimation(launch: $launch, step: 3, totalSteps: 6))

                    Text("Password")
                        .font(.headline)
                        .textContentType(.password)
                        .modifier(OpenAnimation(launch: $launch, step: 4, totalSteps: 6))

                    SecureField("Enter password", text: $password)
                        .modifier(OpenAnimation(launch: $launch, step: 5, totalSteps: 6))

                    Button {
                        launch = false
                        back = false
                    } label: {
                        Text("Login")
                    }
                    .padding(.top)
                    .buttonStyle(.borderedProminent)
                    .modifier(OpenAnimation(launch: $launch, step: 6, totalSteps: 6))
                }
                .padding()
                .background {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .foregroundColor(Color.customColor.primaryGreenColor)
                        .opacity(0.8)
                }
                .textFieldStyle(.roundedBorder)
                .padding()
                .buttonStyle(.borderedProminent)
                .modifier(OpenAnimation(launch: $launch, step: 5, totalSteps: 5))
                .onAppear {
                    launch = true
                }
            }
        .edgesIgnoringSafeArea(.all)
    }
    func validateEmail() -> Bool {
           if #available(iOS 16, *) {
               let regex = try? Regex(regexEmail)
               if let _ = try? regex?.wholeMatch(in: user) {
                   return true
               } else {
                   return false
               }
           } else {
               if let range = user.range(of: regexEmail, options: .regularExpression),
                  range.lowerBound == user.startIndex, range.upperBound == user.endIndex {
                   return true
               } else {
                   return false
               }
           }
       }
    }

#Preview {
    LoginView(back: .constant(true))
}



