//
//  SwiftUIView.swift
//  LottieAnimationHelper
//
//  Created by MaxK on 07.05.2025.
//

import SwiftUI
import Lottie

public struct SwiftUIView: View {
    
    public var fileName: String
    public var contentMode: UIView.ContentMode
    public var shouldPlay: Bool
    public var loopMode: LottieLoopMode
    public var animationDidFinish: (() -> Void)?
    
    public init(animationFileName: String, contentMode: UIView.ContentMode, shouldPlay: Bool, playLoopMode: LottieLoopMode, animationDidFinish: (() -> Void)? = nil) {
        self.fileName = animationFileName
        self.contentMode = contentMode
        self.shouldPlay = shouldPlay
        self.loopMode = playLoopMode
        self.animationDidFinish = animationDidFinish
    }
    
    public var body: some View {
        LottieView(animation: .named(fileName))
            .configure { LottieAnimationView in
                LottieAnimationView.contentMode = contentMode
            }
            .playbackMode(shouldPlay ? .playing(.toProgress(1, loopMode: loopMode)) : .paused)
            .animationDidFinish { completed in
                animationDidFinish?()
            }
    }
}

#Preview {
    SwiftUIView(animationFileName: "", contentMode: .scaleToFill, shouldPlay: false, playLoopMode: .playOnce)
}
