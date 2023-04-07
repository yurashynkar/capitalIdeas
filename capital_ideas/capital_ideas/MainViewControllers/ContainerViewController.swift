import UIKit

class ContainerViewController: UIViewController {

    enum MenuState {
        case opened
        case closed
    }

    private var menuState: MenuState = .closed

    let menuVC = MenuViewController()
    let homeVC = HomeViewController()
    var navVC: UINavigationController?
    lazy var infoVC3 = TwentyThreeViewController()
    lazy var infoVC4 = TelegramViewController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addChildVC()
        overrideUserInterfaceStyle = .light

        
    }

    private func addChildVC() {
        // Menu
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)

        //Home
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
    

}

extension ContainerViewController: HomeViewControllerDelegate {
    func didTapMenuButton() {
        toggleMenu(completion: nil)
        homeVC.view.subviews.forEach { view in
            if view is UIImageView {
                return
            }
            view.removeFromSuperview()
        }
        homeVC.children.last?.removeFromParent()
        
    }
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState {
        case .closed:
            // open it
            UIView.animate(
                withDuration: 0,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseInOut
            ) {
                self.navVC?.view.frame.origin.x = self.homeVC.view.frame.size.width - 100
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opened
                }
            }
        case .opened:
            // closed it
            UIView.animate(
                withDuration: 0,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: .curveEaseInOut
            ) {
                self.navVC?.view.frame.origin.x = 0

            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                }
            }
        }
    }
}
extension ContainerViewController: MenuViewControllerDelegate {
    
    func didSelect(menuItem: MenuViewController.MenuOptions) {
        toggleMenu(completion: nil)
        switch menuItem {
        case .home:
            self.resetToHome()
        case .year23:
            self.addInfo3()
        case .tg:
            self.addInfotg()
        }
    }
    
    func resetToHome() {
        infoVC3.view.removeFromSuperview()
        infoVC3.didMove(toParent: nil)
        homeVC.title = ""
        
    }
    func addInfo3() {
        let vc3 = infoVC3
        let optionsMenu3 = MenuOptions3.allCases.map {
            Options(
                name: $0.rawValue,
                imageName: $0.imageName,
                docName: $0.docName
            )
        }
        vc3.setOptions(optionsMenu3)
        homeVC.addChild(vc3)
        homeVC.view.addSubview(vc3.view)
        vc3.view.frame = view.frame
        vc3.didMove(toParent: homeVC)
        homeVC.title = vc3.title
    }
    func addInfotg() {
        let vc4 = infoVC4
                
        homeVC.addChild(vc4)
        homeVC.view.addSubview(vc4.view)
        vc4.view.frame = view.frame
        vc4.didMove(toParent: homeVC)
        homeVC.title = vc4.title
    }
}
