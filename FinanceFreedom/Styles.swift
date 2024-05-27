//
//  Styles.swift
//  FinanceFreedom
//
//  Created by Luismi on 4/5/24.
//

import SwiftUI

extension Text {
    func onboardingText() -> some View {
        
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.custom("Khula", size: 12))
    }
}

extension Text {
    func financeStatus(fontWeight: Font.Weight = .black) -> some View {
        
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundColor(.primaryColor2)
            .font(.custom("Khula", size: 28))
            .fontWeight(fontWeight)
            .padding()
    }
}
extension Text {
    func incomeNumberStatus() -> some View {
        
        self
            .font(.custom("khula", size: 20))
            .foregroundColor(Color.primaryColor1)
            .padding(.horizontal, 65)
    }
}

extension Text {
    func incomeTextStatus() -> some View {
        
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .foregroundColor(Color.primaryColor1)
            .font(.custom("khula", size: 16))
    }
}
extension Text {
    func expensesNumberStatus() -> some View {
        
        self
            .font(.custom("khula", size: 20))
            .foregroundColor(Color.secondaryColor1)
            .padding(.horizontal, 65)
    }
}

extension Text {
    func expensesTextStatus() -> some View {
        
        self
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 30)
            .foregroundColor(Color.secondaryColor1)
            .font(.custom("khula", size: 16))
    }
}

struct buttonGreen: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .frame(maxWidth: .infinity)
            .font(.sectionCategories())
            .padding(10)
            .background(configuration.isPressed ? Color.secondaryColor3 : Color.primaryColor1)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct buttonWhite: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.secondaryColor3 : Color.secondaryColor4)
            .frame(maxWidth: .infinity)
            .font(.sectionCategories())
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .cornerRadius(8)
            .padding(.horizontal)
    }

}



struct buttonWhiteCategory: ButtonStyle {
    @State private var isPrimaryColor = false
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.secondaryColor3 : Color.secondaryColor4)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(configuration.isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .cornerRadius(8)
            .padding(.horizontal)
            .onTapGesture {self.isPrimaryColor.toggle()}
    }
}


struct ButtonFilterCategory: ButtonStyle {
    @State var isPressed = true
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(isPressed ? Color.secondaryColor3 : Color.secondaryColor4)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(isPressed ? Color.primaryColor1 : Color.secondaryColor3)
            .cornerRadius(8)
            .padding(.horizontal)
            .onTapGesture {self.isPressed.toggle()}
           
    }
}

struct onboardingButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(alignment: .leading)
            .padding(10)
            .font(.custom("Khula", size: 12))
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

struct ToggleCategoty: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(configuration.isOn ? Color.primaryColor1 : Color.secondaryColor3)
        .padding(5)
        .background(configuration.isOn ? Color.secondaryColor3 : Color.primaryColor1)
        .cornerRadius(8)
    }
}
struct buttonGray: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(configuration.isPressed ? Color.black : Color.white)
            .frame(maxWidth: .infinity)
            .padding(10)
            .background(configuration.isPressed ? Color.secondaryColor3 : Color.primaryColor2)
            .cornerRadius(8)
            .padding(.horizontal)
    }
}

extension Color {
    static let primaryColor1 = Color(#colorLiteral(red: 0, green: 0.7127789855, blue: 0, alpha: 1))
    static let primaryColor2 = Color(#colorLiteral(red: 0.3847852647, green: 0.3847852647, blue: 0.3847852647, alpha: 1))
    static let secondaryColor1 = Color(#colorLiteral(red: 0.8866234422, green: 0.03123403899, blue: 0, alpha: 1))
    static let secondaryColor2 = Color(#colorLiteral(red: 0.9301789403, green: 0.4312080145, blue: 0, alpha: 1))
    static let secondaryColor3 = Color(#colorLiteral(red: 0.9409594536, green: 0.9528051019, blue: 0.9525968432, alpha: 1))
    static let secondaryColor4 = Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1))
}

extension Font {
    static func displayTitle() -> Font {
        return Font.custom("Markazi Text", size: 38) .weight(.bold)
    }
    static func subTitle() -> Font {
        return Font.custom("Markazi Text", size: 30) .weight(.regular)
    }
    static func leadText() -> Font {
        return Font.custom("Karla", size: 14) .weight(.medium)
    }
    static func sectionTitle() -> Font {
        return Font.custom("Karla", size: 18) .weight(.black)
    }
    static func sectionCategories() -> Font {
        return Font.custom("Karla", size: 12) .weight(.bold)
    }
    static func cardTitle() -> Font {
        return Font.custom("Karla", size: 24) .weight(.bold)
    }
    static func paragraphText() -> Font {
        return Font.custom("Karla", size: 20) .weight(.regular)
    }
    static func highLightText() -> Font {
        return Font.custom("Karla", size: 16)
    }
}
