import SnapKit
import UIKit

final class DropDownMenu: UIView {
    
    var isSeleted: Bool = false
//    var screen: UIView!
    var absolutFrame: CGRect!
    
    lazy var textView: RoundBorderBox_TMB = {
        
        //init에서 할당시 뷰 위계 버그 있음
//        absolutFrame = view.convert(view.bounds, to: view)
        
        let textView = RoundBorderBox_TMB(frame: CGRect(x: 0 , y: view.bounds.maxY + 8, width: 84, height: 1))
        
        //애니메이션 최초 실행시 좌측에서 날아오는 버그 방지 코드
        textView.center.x = view.bounds.midX
        
        textView.layer.cornerRadius = 8
        textView.backgroundColor = .white
        
        
        return textView
    }()
    
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
//        self.screen = screen
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
//        view.addSubview(textView)
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
        view.alpha = 0.3
        textView.alpha = 1
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.alpha = 1.0
        textView.alpha = 1

        if !isSeleted{
            if !textView.isDescendant(of: view){
                addSubview(textView)
            }
            
            textView.snp.updateConstraints({
                $0.centerX.equalTo(view.snp.centerX)
                $0.top.equalTo(view.snp.bottom).offset(8)
                $0.width.equalTo(84)
                $0.height.equalTo(80)
            })
            
            view.backgroundColor = UIColor(named: Constants.Assetname.Colors.Background.bg2)
            
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: layoutIfNeeded)
            
            isSeleted = true
            return
        }
        
        view.backgroundColor = .white
        
        textView.snp.updateConstraints({
            $0.height.equalTo(0)
        })
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseInOut, animations: layoutIfNeeded)
        
        isSeleted = false
    }
}
