import UIKit
import LinkPresentation
class TelegramViewController: UIViewController {

    let string = "https://t.me/capital_ideas"

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPreview()
        title = "join us on telegram"
        view.backgroundColor = .white
        overrideUserInterfaceStyle = .light
    }
    func fetchPreview() {
        guard let url = URL(string: string) else {
            return
        }
        let linkPreview = LPLinkView()
        let provider = LPMetadataProvider()
        provider.startFetchingMetadata(for: url) { [weak self] metaData, error in
            guard let data = metaData, error == nil else {
                return
            }
            DispatchQueue.main.async {
                linkPreview.metadata = data
                self?.view.addSubview(linkPreview)
                linkPreview.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
                linkPreview.center = self?.view.center ?? .zero
            }
        }
    }
}
