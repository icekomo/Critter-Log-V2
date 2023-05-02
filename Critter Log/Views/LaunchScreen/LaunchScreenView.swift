//
//  LaunchScreenView.swift
//  Critter Log
//
//  Created by Josh Gdovin on 5/1/23.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State private var firstPhaseIsAnimating: Bool = false
    @State private var secondPhaseIsAnimating: Bool = false
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack {
            background
            logo
        }
        .onReceive(timer) { input in

            switch launchScreenManager.state {
            case .first:
                    withAnimation(.spring()) {
                        firstPhaseIsAnimating.toggle()
                    }
            case .second:
                withAnimation(.easeInOut) {
                        secondPhaseIsAnimating.toggle()
                    }
            default: break
            }
        }
        .opacity(secondPhaseIsAnimating ? 0 : 1)
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
            .environmentObject(LaunchScreenManager())
    }
}

private extension LaunchScreenView {
    var background: some View {
        Color("GreenLight")
            .edgesIgnoringSafeArea(.all)
    }
    
    var logo: some View {
        Image("Load-Screen")
            .scaleEffect(firstPhaseIsAnimating ? 0.6 : 1)
            .scaleEffect(secondPhaseIsAnimating ? UIScreen.main.bounds.size.height / 4 : 1)
    }
}
