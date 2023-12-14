import SnapKit
import UIKit

final class DropDownMenu: UIView {
    
    var isSeleted: Bool = false
    var screen: UIView!
    var absolutFrame: CGRect!
    
    lazy var textView: RoundBorderBox_TMB = {
        
        absolutFrame = view.convert(view.bounds, to: screen)

        
        let textView = RoundBorderBox_TMB(frame: CGRect(x: 0 , y: absolutFrame.maxY + 8, width: 84, height: 1))
        
        textView.translatesAutoresizingMaskIntoConstraints = false

        textView.layer.cornerRadius = 8
        
        textView.backgroundColor = .white

        heightConst = textView.heightAnchor.constraint(equalToConstant: 0)
        
        return textView
    }()
    
    var heightConst:NSLayoutConstraint!
    
    lazy var titleText: Body14_Label = {
        let label = Body14_Label(frame: CGRect(x: 0, y: 0, width: 36, height: 24))
        label.text = "최신순"
        label.textColor = UIColor(named: Constants.Assetname.Colors.Text.Secondary)
        return label
    }()
    
    lazy var dropDownImage: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: Constants.Assetname.Images.Symbol.DropDown)
        return imageView
    }()
    
    lazy var view: RoundBorderBox_TMB = {
        let view = RoundBorderBox_TMB(frame: frame)
        view.layer.borderWidth = 0
        view.layer.cornerRadius = 4
        return view
    }()
    
    init(frame: CGRect, screen: UIView){
        super.init(frame: frame)
        self.screen = screen
        setUI()
        setConstraints()
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame) //68 * 32
//        backgroundColor = .black
        setUI()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUI() {
        addSubview(view)
        view.addSubview(titleText)
        view.addSubview(dropDownImage)
    }
    
    func setConstraints() {
        titleText.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalToSuperview().offset(8)
        }
        dropDownImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.left.equalTo(titleText.snp.right)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 0.3
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        alpha = 1.0
        
        if !isSeleted{
            if !textView.isDescendant(of: screen){
                screen.addSubview(textView)
            }
            
            let frame = view.convert(view.bounds, to: screen)
            
            textView.center.x = frame.midX
            
            NSLayoutConstraint.activate([
                textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                textView.widthAnchor.constraint(equalToConstant: 84),
                textView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 8)
            ])
                        
            heightConst.constant = 80
            heightConst.isActive = true
            
            view.backgroundColor = UIColor(named: Constants.Assetname.Colors.Background.bg2)
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: screen!.layoutIfNeeded)
            
            isSeleted = true
            return
        }
        
        view.backgroundColor = .white
        
        
        heightConst.constant = 0
        heightConst.isActive = true
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: screen!.layoutIfNeeded)
        
//        textView.removeFromSuperview()
        isSeleted = false
    }
}
