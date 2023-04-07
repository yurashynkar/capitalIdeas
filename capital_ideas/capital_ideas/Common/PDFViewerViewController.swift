import UIKit
import PDFKit
import SnapKit
import Foundation

final class PDFViewerViewController: UIViewController, UISearchBarDelegate {

    private let pdfView = PDFView()
    private var document: PDFDocument?
    private var currentSelectionIndex = 0
    private var currentSearchText: String = ""
    private var selections: [PDFSelection] = []
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .light
        setupPDFView()
        
    }

    func setPdfDocument(document: PDFDocument) {
        self.document = document
        pdfView.document = document
    }
}



private extension PDFViewerViewController {
    func setupPDFView() {
        pdfView.displayDirection = .vertical
        pdfView.maxScaleFactor = 1.1
        pdfView.minScaleFactor = 1.1
        pdfView.autoScales = true
        view.addSubview(pdfView)
        pdfView.snp.makeConstraints { make in
            make.edges.equalTo(view.snp.edges)
        }
    }
}
