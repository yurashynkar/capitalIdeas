import UIKit
import SnapKit

protocol HomeViewControllerDelegate: AnyObject {
        func didTapMenuButton()
}

class HomeViewController: BaseViewController {
    
    private let logoImageView = UIImageView()
    
    
    weak var delegate: HomeViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupView()
    }
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
}

private extension HomeViewController {
    func setupView() {
        view.backgroundColor = .white
        title = ""
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "list.dash"),
            style: .done,
            target: self,
            action: #selector(didTapMenuButton)
        )
        navigationItem.leftBarButtonItem?.tintColor = .black
        setupLogoView()
        logoImageView.image = UIImage(named: "logo")
        
    }
    
    func setupLogoView() {
    
         
        view.addSubview(logoImageView)
        logoImageView.snp.makeConstraints { make in
            make.width.height.equalTo(250)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(32)
        }
    }
}
