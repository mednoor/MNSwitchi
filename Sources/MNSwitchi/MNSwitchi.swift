import UIKit

public class MNSwitchiView: UIView {
    
    lazy var firstButton: UIButton = {
        
        let button = UIButton()
        button.tag = 0
        
        return button
    }()
    
    lazy var secondButton: UIButton = {
        
        let button = UIButton()
        button.tag = 1
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    lazy var selectedView: UIView = {
        
        let view = UIView(frame: .zero)
        
        return view
    }()
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        self.stackView.addArrangedSubview(self.firstButton)
        self.stackView.addArrangedSubview(self.secondButton)
        
        self.insertSubview(self.stackView, at: 0)
    }
    
    public func render() {
        
    }
}

public struct MNSwitchiViewAppearance {
    let backgroundColor: UIColor
}
