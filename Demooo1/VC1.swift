////
////  VC1.swift
////  Demooo1
////
////  Created by Asif on 13/01/24.
////
//
//import UIKit
//
//class VC1: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
//    let data: [String] = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 5 this is last item in cell" ]
//
//
//    let collectionView: UICollectionView = {
//            let layout = UICollectionViewFlowLayout()
//            layout.scrollDirection = .horizontal
//            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//            collectionView.translatesAutoresizingMaskIntoConstraints = false
//            // Add any additional setup for your collection view
//            return collectionView
//        }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .blue
//        // Do any additional setup after loading the view.
//        collectionView.register(customCell.self, forCellWithReuseIdentifier: customCell.cellIdentity)
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.backgroundColor = .white // Set the background color as needed
//
//        view.addSubview(collectionView)
//
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
//            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
//            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
//            collectionView.heightAnchor.constraint(equalToConstant: 50)
//        ])
//        self.setupUI()
//    }
//
//
//    private func setupUI() {
//
//        lazy var containerView = UIView()
//        containerView.backgroundColor = .white
//        containerView.layer.cornerRadius = 20
//        containerView.layer.borderColor = UIColor.clear.cgColor
//        containerView.layer.borderWidth = 2
//        containerView.layer.shadowColor = UIColor.gray.cgColor
//        containerView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        containerView.layer.shadowOpacity = 0.2
//        containerView.layer.shadowRadius = 4
//        containerView.translatesAutoresizingMaskIntoConstraints = false
//
//        lazy var downloadBtnView = UIView()
//        downloadBtnView.backgroundColor = .black
//        downloadBtnView.layer.cornerRadius = 40 / 2
//        downloadBtnView.alpha = 0.5
//        downloadBtnView.translatesAutoresizingMaskIntoConstraints = false
//
//        lazy var downloadBtn = UIButton()
//        downloadBtn.setImage(UIImage(named: "download")?.withRenderingMode(.alwaysTemplate), for: .normal)
//        downloadBtn.tintColor = .white
//        downloadBtn.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
//        downloadBtn.translatesAutoresizingMaskIntoConstraints = false
//
//        lazy var crossBtnView = UIView()
//        crossBtnView.backgroundColor = .black
//        crossBtnView.layer.cornerRadius = 40 / 2
//        crossBtnView.alpha = 0.5
//        crossBtnView.translatesAutoresizingMaskIntoConstraints = false
//
//        lazy var crossBtn = UIButton()
//        crossBtn.setImage(UIImage(named: "cross")?.withRenderingMode(.alwaysTemplate), for: .normal)
//        crossBtn.tintColor = .white
//        crossBtn.translatesAutoresizingMaskIntoConstraints = false
//
//
//
//        lazy var imageView = UIImageView()
//        imageView.image = UIImage(named: "qr")
//        imageView.contentMode = .scaleToFill
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//
//        lazy var qrTextLabel = UILabel()
//        qrTextLabel.text = "QR Code"
//        qrTextLabel.textAlignment = .center
//        qrTextLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        qrTextLabel.textColor = .black
//        qrTextLabel.translatesAutoresizingMaskIntoConstraints = false
//
//
//
//        self.view.addSubview(containerView)
//        containerView.addSubview(downloadBtnView)
//        containerView.addSubview(qrTextLabel)
//        downloadBtnView.addSubview(downloadBtn)
//        containerView.addSubview(crossBtnView)
//        crossBtnView.addSubview(crossBtn)
//        containerView.addSubview(imageView)
//
//        NSLayoutConstraint.activate([
//            containerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
//            containerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            containerView.widthAnchor.constraint(equalToConstant: self.view.bounds.width - 100),
//            containerView.heightAnchor.constraint(equalToConstant: 300),
//
//            downloadBtnView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
//            downloadBtnView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            downloadBtnView.widthAnchor.constraint(equalToConstant: 40),
//            downloadBtnView.heightAnchor.constraint(equalToConstant: 40),
//
//            downloadBtn.topAnchor.constraint(equalTo: downloadBtnView.topAnchor, constant: 5),
//            //            containerView.trailingAnchor.constraint(equalToSystemSpacingAfter: downloadBtn.trailingAnchor, multiplier: 1),
//            downloadBtn.leadingAnchor.constraint(equalTo: downloadBtnView.leadingAnchor, constant: 5),
//            downloadBtn.trailingAnchor.constraint(equalTo: downloadBtnView.trailingAnchor,  constant: -5),
//            downloadBtn.bottomAnchor.constraint(equalTo: downloadBtnView.bottomAnchor, constant: -5),
//
//
//
//            crossBtnView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
//            crossBtnView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            crossBtnView.widthAnchor.constraint(equalToConstant: 40),
//            crossBtnView.bottomAnchor.constraint(equalTo: downloadBtnView.bottomAnchor),
//
//            crossBtn.topAnchor.constraint(equalTo: crossBtnView.topAnchor, constant: 5),
//            crossBtn.leadingAnchor.constraint(equalTo: crossBtnView.leadingAnchor, constant: 5),
//            crossBtn.trailingAnchor.constraint(equalTo: crossBtnView.trailingAnchor, constant: -5),
//            crossBtn.bottomAnchor.constraint(equalTo: crossBtnView.bottomAnchor, constant: -5),
//
//            qrTextLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
//            qrTextLabel.leadingAnchor.constraint(equalTo: crossBtnView.trailingAnchor, constant: 5),
//            qrTextLabel.trailingAnchor.constraint(equalTo: downloadBtnView.leadingAnchor, constant: -5),
//            qrTextLabel.bottomAnchor.constraint(equalTo: downloadBtnView.bottomAnchor),
//
//            //
//            imageView.topAnchor.constraint(equalTo: downloadBtn.bottomAnchor, constant: 5),
//            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
//            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
//            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10)
//
//        ])
//    }
//
//    @objc func downloadButtonTapped() {
//        guard let image = UIImage(named: "qr") else {
//                    print("Image not found")
//                    return
//                }
//
//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
//    }
//
//    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
//            if let error = error {
//                print("Error saving image: \(error.localizedDescription)")
//            } else {
//                print("Image saved successfully.")
//            }
//        }
//
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return data.count
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: customCell.cellIdentity, for: indexPath) as! customCell
//
//           // Set the text for the label in your cell based on the data array
//           cell.textLabel.text = data[indexPath.item]
//        cell.textLabel.textColor = .black
//
//           return cell
//    }
//
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let cell = customCell()
//        // Set the text for the label in your cell based on the data array
//            cell.textLabel.text = data[indexPath.item]
//
//            cell.layoutIfNeeded()
//
//        // Set the desired height (e.g., 30 points) and adjust the width as needed
//        return CGSize(width: cell.textLabel.intrinsicContentSize.width + 16, height: 30)
//    }
//
//
//}
//
//
//
//import UIKit
//
//class VC1: UIViewController {
//    private let passwordTextField: UITextField = {
//        let textField = UITextField()
//        textField.translatesAutoresizingMaskIntoConstraints = false
//        textField.placeholder = "Password"
//        textField.isSecureTextEntry = true
//        textField.borderStyle = .roundedRect
//        return textField
//    }()
//
//    private let eyeButton: UIButton = {
//        let button = UIButton(type: .custom)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setImage(UIImage(systemName: "eye"), for: .normal)
//        button.tintColor = .gray
//        button.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
//        return button
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupUI()
//    }
//
//    private func setupUI() {
//        passwordTextField.rightView = eyeButton
//        passwordTextField.rightViewMode = .always
//
//        view.addSubview(passwordTextField)
//
//        // Constraints for passwordTextField
//        NSLayoutConstraint.activate([
//            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            passwordTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
//    }
//
//    @objc private func togglePasswordVisibility() {
//        // Toggle password visibility
//        passwordTextField.isSecureTextEntry.toggle()
//
//        // Change the button image based on password visibility
//        let buttonImage = passwordTextField.isSecureTextEntry ? UIImage(systemName: "eye") : UIImage(systemName: "eye.slash")
//        eyeButton.setImage(buttonImage, for: .normal)
//    }
//}



