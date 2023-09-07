//
//  HomeView.swift
//  iNEWs
//
//  Created by Paulo Pinheiro on 9/7/23.
//

import SwiftUI
import URLImage


struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    
    var body: some View {
        
        if isActive {
            NewsView()
        } else {
            
            VStack {
                let logoBootcampImgUrl = "https://hermes.dio.me/tracks/61d57203-7c43-4d8d-a3f0-833faa2ce680.png"
                let logoDIOImgUrl = "https://hermes.digitalinnovation.one/assets/diome/logo-minimized.png"
                
                let LogoBootcampURL = URL(string: logoBootcampImgUrl)
                let LogoDIOURL = URL(string: logoDIOImgUrl)
                
                Spacer()
                URLImage(LogoDIOURL!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame( width: 80, height: 80, alignment: .center)
                
                Spacer()
                URLImage(LogoBootcampURL!) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                }
                .frame( width: 200, height: 200, alignment: .center)
                
                Text("Desafio FInal Bootcamp DIO e Santader")
                Text("iNews to learn English")
                    .font(.system(size: 22, weight: .semibold))
                    .padding(.top, 20)
                Spacer()
                Spacer()
            }
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear{
                withAnimation(.easeIn(duration: 1.5)) {
                    self.size = 0.9
                    self.opacity = 1.0
                }
                
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) {
                    self.isActive = true
                }
            }
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
