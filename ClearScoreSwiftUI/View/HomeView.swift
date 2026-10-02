//
//  HomeView.swift
//  ClearScoreSwiftUI
//
//  Created by Rider on 2026/06/06.
//

import SwiftUI
import UIKit
import Lottie

struct HomeView: View {
    @State private var goToDetails = false
    @ObservedObject var viewModel: ClearScoreViewModel

    var body: some View {
        ZStack {
            ZStack {
                AnimatedCircleView()
                    .frame(width: 300, height: 300)
                    .onTapGesture {
                        goToDetails = true
                    }

                VStack(spacing: 10) {
                    Text("Your credit score is")
                        .font(.subheadline)

                    Text("\(viewModel.scoreModel?.creditReportInfo?.score ?? 0)")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundStyle(.red)

                    Text("out of \(viewModel.scoreModel?.creditReportInfo?.maxScoreValue ?? 0)")
                        .font(.subheadline)
                }
            }
            .task {
                viewModel.fetchScore()
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $goToDetails) {
                DetailView(viewModel: viewModel)
            }
            
            // LOADER OVERLAY
            if viewModel.isLoading {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()

                LottieLoaderView(name: "loader")
                    .frame(width: 120, height: 120)
            }
        } 
        .preferredColorScheme(.light)
    }
}


// MARK: - Animated Circle
struct AnimatedCircleView: UIViewRepresentable {

    func makeUIView(context: Context) -> AnimatedCircleUIView {
        let view = AnimatedCircleUIView()
        return view
    }

    func updateUIView(_ uiView: AnimatedCircleUIView,context: Context) {
        uiView.updateLayersFrame()
    }
}


// MARK: - UIKit Circle
final class AnimatedCircleUIView: UIView {

    private let shapeLayer = CAShapeLayer()
    private let gradientLayer = CAGradientLayer()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .white

        setupGradientBorder()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        backgroundColor = .white

        setupGradientBorder()
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        updateLayersFrame()
    }

    
    // MARK: - Pulse Animation
    private func startPulseAnimation() {
        let pulse = CABasicAnimation(
            keyPath: "transform.scale"
        )

        pulse.fromValue = 1.0
        pulse.toValue = 1.1
        pulse.duration = 0.8
        pulse.autoreverses = true
        pulse.repeatCount = .infinity

        layer.add(pulse, forKey: "pulse")
    }

    
    // MARK: - Gradient Border
    private func setupGradientBorder() {

        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.lineCap = .round

        gradientLayer.colors = [
            UIColor.systemPurple.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemBlue.cgColor,
            UIColor.systemOrange.cgColor
        ]

        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)

        layer.addSublayer(gradientLayer)

        gradientLayer.mask = shapeLayer

        startPulseAnimation()
    }

    
    // MARK: - Update Circle Frame
    fileprivate func updateLayersFrame() {

        let bounds = self.bounds

        shapeLayer.frame = bounds
        gradientLayer.frame = bounds

        let radius = min(
            bounds.width,
            bounds.height
        ) / 2 - 4

        let path = UIBezierPath(
            arcCenter: CGPoint(
                x: bounds.width / 2,
                y: bounds.height / 2
            ),
            radius: radius,
            startAngle: -.pi / 2,
            endAngle: 3 * .pi / 2,
            clockwise: true
        )

        shapeLayer.path = path.cgPath
    }
}


// MARK: - Lottie Loader
struct LottieLoaderView: UIViewRepresentable {

    let name: String

    func makeUIView(context: Context) -> LottieAnimationView {

        let animationView = LottieAnimationView(name: name)

        animationView.loopMode = .loop
        animationView.play()

        return animationView
    }

    func updateUIView(
        _ uiView: LottieAnimationView,
        context: Context
    ) {}
}

