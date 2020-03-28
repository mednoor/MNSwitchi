import UIKit

public class MNSwitchiView: UIView {
    
    lazy var firstButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tag = 0
        
        return button
    }()
    
    lazy var secondButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.tag = 1
        
        return button
    }()
    
    lazy var stackView: UIStackView = {
        
        let stackView = UIStackView(frame: self.frame)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        
        return stackView
    }()
    
    lazy var selectedView: UIView = {
        
        let view = UIView(frame: .zero)
        return view
    }()
    
    public var switchedTo: ((_ index: Int) -> Swift.Void)?
    
    private var options: MNSwitchiOptions!
    private var appearance: MNSwitchiAppearance!
    private var isAnimationEnabled = true
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.setOptions(self.options)
        self.setAppearance(self.appearance)
        self.setFonts()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        [self.firstButton,
         self.secondButton].forEach { button in
            
            self.stackView.addArrangedSubview(button)
            
            button.addTarget(self,
                             action: #selector(self.buttonWasPressed),
                             for: .touchUpInside)
        }
        
        self.insertSubview(self.stackView, at: 0)
        self.insertSubview(self.selectedView,
                           belowSubview: self.stackView)
    }
    
    public func render(with content: MNSwitchiContent,
                       appearance: MNSwitchiAppearance,
                       options: MNSwitchiOptions) {
        
        self.setContent(content)
        self.appearance = appearance
        self.options = options
    }
    
    @objc private func buttonWasPressed(_ sender: UIButton) {
        
        self.firstButton.isSelected = sender.tag == 0
        self.secondButton.isSelected = sender.tag == 1
        
        self.setFonts()
        
        if self.isAnimationEnabled {
            self.animate(to: sender)
            
        } else {
            self.selectedView.frame = sender.frame
            self.switchedTo?(sender.tag)
        }
    }
    
    private func animate(to button: UIButton) {
        
        let animation = UIViewPropertyAnimator(duration: 0.2,
                                               curve: .easeInOut) {
                                                
            self.selectedView.frame = button.frame
        }
        
        animation.startAnimation()
        animation.addCompletion { _ in
            
            self.switchedTo?(button.tag)
        }
    }
}

// MARK: - Content
extension MNSwitchiView {
    
    private func setContent(_ content: MNSwitchiContent) {
        
        self.firstButton.setTitle(content.first, for: .normal)
        self.secondButton.setTitle(content.second, for: .normal)
    }
}

// MARK: - Appearance
extension MNSwitchiView {
    
    private func setAppearance(_ appearance: MNSwitchiAppearance) {
        
        self.backgroundColor = appearance.backgroundColor
        self.selectedView.backgroundColor = appearance.selectedViewBackgroundColor
        
        if appearance.cornersRounded {
            self.selectedView.layer.cornerRadius = self.selectedView.frame.height / 2
        }
        
        let states = appearance.states
        
        [self.firstButton,
         self.secondButton].forEach { button in
            
            button.setTitleColor(states.default.textColor, for: .normal)
            button.setTitleColor(states.selected.textColor, for: .selected)
            button.setTitleColor(states.highlighted.textColor, for: .highlighted)
            button.tintColor = .clear
        }
    }
    
    private func setFonts() {
        
        let states = self.appearance.states
        
        [self.firstButton, self.secondButton].forEach { button in
            
            if button.isSelected {
                button.titleLabel?.font = states.selected.titleFont
            } else if button.isHighlighted {
                button.titleLabel?.font = states.highlighted.titleFont
            } else {
                button.titleLabel?.font = states.default.titleFont
            }
        }
    }
}

// MARK: - Options
extension MNSwitchiView {
    
    private func setOptions(_ options: MNSwitchiOptions) {
        
        let isFirst = options.defaultSelectedItem == 0
        
        self.firstButton.isSelected = isFirst
        self.secondButton.isSelected = !isFirst
        
        self.selectedView.frame = isFirst ?
            self.firstButton.frame : self.secondButton.frame
        
        self.isAnimationEnabled = options.enableAnimation
    }
}
