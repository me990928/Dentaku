//
//  NumberPadView.swift
//  Dentaku
//
//  Created by 広瀬友哉 on 2023/07/10.
//

import SwiftUI

struct NumberButtonStyle:ButtonStyle{
    let color:String
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .padding()
            .background(configuration.isPressed ? .white:Color(color))
    }
}


struct NumeberButton:View{
    @State var Number:String
    let color:String
    @State var dNum:String = "C"
    
    @State var btnFlag:Bool = false
    @State var zeroFlag:Bool = false
    
    @Binding var size:CGFloat
    
    var body:some View{
        Button {
            print(Number)
            if self.Number == "AC" {
                btnFlag.toggle()
            }
            print(size)
        } label: {
            
            Text(String(btnFlag ? dNum:self.Number)).frame(width: zeroFlag ? size*3:size,height: size).animation(.none)
                
        }.buttonStyle(NumberButtonStyle(color: color)).cornerRadius(100)
            .font(.title).foregroundColor(Color(.white)).animation(.easeInOut(duration: 0.05))
            .onAppear(){
                if self.Number == "0" {
                    zeroFlag = true
                }
            }
            
    }
}

struct NumeberPadView:View{
    @State var btnWidth:CGFloat
    
    var body: some View{
        GeometryReader{ geo in
            VStack(){
                Spacer()
                HStack(){
                    Spacer()
                    NumeberButton(Number: "AC", color: "Gray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "+/-", color: "Gray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "%", color: "Gray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "÷", color: "Orange", size: $btnWidth)
                    Spacer()
                }
                HStack(){
                    Spacer()
                    NumeberButton(Number: "7", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "8", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "9", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "×", color: "Orange", size: $btnWidth)
                    Spacer()
                }
                HStack(){
                    Spacer()
                    NumeberButton(Number: "4", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "5", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "6", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "-", color: "Orange", size: $btnWidth)
                    Spacer()
                }
                HStack(){
                    Spacer()
                    NumeberButton(Number: "1", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "2", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "3", color: "DarkGray", size: $btnWidth)
                    Spacer()
                    NumeberButton(Number: "+", color: "Orange", size: $btnWidth)
                    Spacer()
                }
                HStack(){
//                    Spacer()
//                    NumeberButton(Number: "8", color: "DarkGray", btnColor: $btnColor).frame(width: geo.size.width / 2.3,height: geo.size.width / 5).background(Color("DarkGray"))
//                        .cornerRadius(100)
//                    Spacer()
//                    NumeberButton(Number: "8", color: "DarkGray", btnColor: $btnColor).frame(width: geo.size.width / 5,height: geo.size.width / 5).background(Color("DarkGray"))
//                        .cornerRadius(100)
//                    Spacer()
//                    NumeberButton(Number: "8", color: "DarkGray", btnColor: $btnColor).frame(width: geo.size.width / 5,height: geo.size.width / 5).background(Color("Orange"))
//                        .cornerRadius(100)
//                    Spacer()
                    
                        Spacer()
                        NumeberButton(Number: "0", color: "DarkGray", size: $btnWidth)
                        Spacer()
                        NumeberButton(Number: ".", color: "DarkGray", size: $btnWidth)
                        Spacer()
                        NumeberButton(Number: "=", color: "Orange", size: $btnWidth)
                        Spacer()
                }
                Spacer()
            }.onAppear(){
                btnWidth = geo.size.width / 8
                print(btnWidth)
            }
        }
    }
}



struct Preview_NumeberPadView: PreviewProvider {
    static var previews: some View {
        NumeberPadView(btnWidth: 0)
    }
}

