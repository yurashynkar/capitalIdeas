import UIKit
import PDFKit
protocol TwentyThreeViewControllerDelegate: AnyObject {
    func didSelect(menuItem: MenuOptions3)
    func didTapMenuButton()
}

struct Options {
    var name: String
    var imageName: String
    var docName: String
}

enum MenuOptions3: String, CaseIterable {
    case march = "march"
    case april = "april"
    case may = "may"
    case june = "june"
    case july = "july"
    case aug = "august"
    case sep = "september"
    case oct = "october"
    case nov = "november"
    case dec = "december"

            var imageName: String {
                switch self {
                case .march:
                    return "list.clipboard.fill"
                case .april:
                    return "lock.fill"
                case .may:
                    return "lock.fill"
                case .june:
                    return "lock.fill"
                case .july:
                    return "lock.fill"
                case .aug:
                    return "lock.fill"
                case .sep:
                    return "lock.fill"
                case .oct:
                    return "lock.fill"
                case .nov:
                    return "lock.fill"
                case .dec:
                    return "lock.fill"
                }
            }
            var docName: String {
                switch self {
                case .march:
                    return "march_2023"
                case .april:
                    return ""
                case .may:
                    return "lock.fill"
                case .june:
                    return "lock.fill"
                case .july:
                    return "lock.fill"
                case .aug:
                    return "lock.fill"
                case .sep:
                    return "lock.fill"
                case .oct:
                    return "lock.fill"
                case .nov:
                    return "lock.fill"
                case .dec:
                    return "lock.fill"
        }
    }
}

class TwentyThreeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    weak var delegate: TwentyThreeViewControllerDelegate?
    private var options: [Options] = []
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = nil
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    var grayColor = UIColor(red: 0.6588, green: 0.6588, blue: 0.6588, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = grayColor
        overrideUserInterfaceStyle = .light

    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.bounds.size.width, height:
                view.bounds.size.height)
    }
    
    func setOptions(_ options: [Options]) {
        self.options = options
        tableView.reloadData()
    }
    func showPdfFor(docName: String) {
        guard
            let url = Bundle.main.url(forResource: docName, withExtension: "pdf"),
            let document = PDFDocument(url: url)
        else { return }
        let pdfViewer = PDFViewerViewController()
        pdfViewer.setPdfDocument(document: document)
        navigationController?.pushViewController(pdfViewer, animated: true)
    }
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row].name
        cell.textLabel?.textColor = .white
        cell.imageView?.image = UIImage(systemName: options[indexPath.row].imageName)
        cell.imageView?.tintColor = .white
        cell.backgroundColor = grayColor
        cell.contentView.backgroundColor = grayColor
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = options[indexPath.row].docName
        showPdfFor(docName: item)

    }
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
    }
}
