import UIKit

class t1: UITableViewController {

    let sampleData = ["Item 1", "Item 2", "Item 3", "Item 4", "Item 5"]

    override func numberOfSections(in tableView: UITableView) -> Int {
        // Assuming you have only one section
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "YourCellIdentifier", for: indexPath) as! YourCustomCell
        cell.titleLabel.text = sampleData[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.lightGray // Set the background color as per your design
        
        let headerLabel = UILabel()
        headerLabel.text = "Your Header Title"
        headerLabel.textColor = UIColor.black // Set the text color as per your design
        headerLabel.frame = CGRect(x: 15, y: 5, width: tableView.frame.width - 30, height: 30) // Adjust the frame as per your design
        
        headerView.addSubview(headerLabel)
        
        return headerView
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Handle row selection if needed
        print("Selected item: \(sampleData[indexPath.row])")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(YourCustomCell.self, forCellReuseIdentifier: "YourCellIdentifier")
    }
}



import UIKit

class YourCustomCell: UITableViewCell {
    // Customize your cell as needed
    let titleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        // Add your custom UI components to the cell
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
