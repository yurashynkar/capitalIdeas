import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        print("[LOG] METHOD: - \(#function) CLASS: - \(String(describing: self))")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("[LOG] METHOD: - \(#function) CLASS: - \(String(describing: self))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("[LOG] METHOD: - \(#function) CLASS: - \(String(describing: self))")
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("[LOG] METHOD: - \(#function) CLASS: - \(String(describing: self))")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        print("[LOG] METHOD: - \(#function) CLASS: - \(String(describing: self))")
    }
    
}
