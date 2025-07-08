import UIKit

final class ViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.text = "Ask Me Anything..."
        label.font = UIFont(name: "Chalkduster", size: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let imageLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(resource: .ball1)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Ask", for: .normal)
        button.addTarget(
            self,
            action: #selector(buttonAction),
            for: .touchUpInside
        )
        button.backgroundColor = .white
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        addSubviews()
        setupConstraints()
    }

    @objc
    private func buttonAction() {
        let images = ["ball1", "ball2", "ball3", "ball4", "ball5"]
        imageLogo.image = UIImage(named: images.randomElement() ?? "ball1")
        
    }
}

// MARK: - Setup Constraints

private extension ViewController {
    func addSubviews() {
        view.addSubview(label)
        view.addSubview(imageLogo)
        view.addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate(
            [
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                imageLogo.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 100),
                imageLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                button.topAnchor.constraint(equalTo: imageLogo.bottomAnchor, constant: 100),
                button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            ]
        )
    }
}
