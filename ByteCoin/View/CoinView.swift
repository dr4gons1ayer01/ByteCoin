//
//  CoinView.swift
//  ByteCoin
//
//  Created by Иван Семенов on 13.03.2024.
//

import UIKit

class CoinView: UIView {
    
    let byteCoinLabel = UILabel(text: "ByteCoin", 
                                textColor: UIColor(named: "textColor")!)
    let bitcoinImageView = UIImageView(image: UIImage(systemName: "bitcoinsign.circle.fill"))
    let сurrencyPriceLabel = UILabel(text: "1.000.000")
    let сurrencyPairLabel = UILabel(text: "USD")
    let picker = UIPickerView()
    
    init() {
        super.init(frame: CGRect())
        setupUI()
        
    }
    func setupUI() {
        backgroundColor = UIColor(named: "bg")
        bitcoinImageView.tintColor = UIColor(named: "iconColor")
        bitcoinImageView.contentMode = .scaleAspectFit
        
        let emptySpace1 = UIView()
        let emptySpace2 = UIView()
        
        let topStack = UIStackView(arrangedSubviews: [emptySpace1,
                                                      bitcoinImageView,
                                                      сurrencyPriceLabel,
                                                      сurrencyPairLabel,
                                                      emptySpace2,
                                                     ])
        topStack.axis = .horizontal
        topStack.spacing = 10
        topStack.backgroundColor = UIColor(named: "stackColor")
        topStack.layer.cornerRadius = 20
        
        let stack = UIStackView(arrangedSubviews: [byteCoinLabel,
                                                   topStack,
                                                   picker])
        stack.axis = .vertical
        stack.spacing = 50
        stack.alignment = .center
        stack.setCustomSpacing(150, after: topStack)
        
        addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topStack.widthAnchor.constraint(equalTo: stack.widthAnchor),
            topStack.heightAnchor.constraint(equalToConstant: 60),
            
            stack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stack.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bitcoinImageView.widthAnchor.constraint(equalToConstant: 40),
            bitcoinImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension UILabel {
    convenience init(text: String, textColor: UIColor = UIColor(named: "iconColor")!) {
        self.init()
        self.text = text
        self.textColor = textColor
        font = UIFont(name: "Gilroy-Regular", size: 40)
    }
}
import SwiftUI

struct CoinViewProvider: PreviewProvider {
    static var previews: some View {
        ContainerView().ignoresSafeArea()
    }
    struct ContainerView: UIViewRepresentable {
        let view = CoinView()
        
        func makeUIView(context: Context) -> some UIView {
            return view
        }
        func updateUIView(_ uiView: UIViewType, context: Context) { }
    }
}
