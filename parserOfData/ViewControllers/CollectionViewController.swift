import UIKit

final class CollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: UICollectionViewDataSource
    private let countProfiles = Profile.allCases
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countProfiles.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "theCell", for: indexPath)
        guard let cell = cell as? CollectionViewCell else { return UICollectionViewCell() }
        cell.label.text = countProfiles[indexPath.item].title
        
        return cell
    }
}



// MARK: UICollectionViewDelegate
extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 50, height: 100)
    }
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tappedButton = countProfiles[indexPath.item]
        switch tappedButton {
        case .imageAvatar:
            return print("Image Avatar")
        case .shortData:
            return print("Short Data")
        case .smth:
            checkJSON()
            print("Check output")
            return
        }
    }
}



//  MARK: - Create func to check JSON
extension CollectionViewController {
    private func checkJSON() {
        URLSession.shared.dataTask(with: Links.shortDataUrl.url) { [weak self] data, _, error in
            guard let self else {return}
            guard let data else {
                print(error?.localizedDescription ?? "")
                return
            }
            do {
                let jsonData = try JSONDecoder().decode([dataJSON].self, from: data)
                print(jsonData)
            } catch {
                print(error)
                print("Parsing it's not working")
            }
        }.resume()
    }
}
