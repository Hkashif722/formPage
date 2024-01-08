//import UIKit
//
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    let tableView = UITableView()
//    var questionList: [(question: String, options: [String])] = []
//    var selectedOptions: [String?] = []
//    var currentQuestionIndex: Int = 0
//    var questionText = UILabel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        setupQuestionList()
//        setupUI()
//
//        tableView.register(MultipleChoiceCell.self, forCellReuseIdentifier: "cell")
//        tableView.separatorInset = UIEdgeInsets(top: 20, left: 0 , bottom: 20, right: 0)
//        tableView.tableFooterView = UIView()
//        tableView.dataSource = self
//        tableView.delegate = self
//    }
//
//    func setupQuestionList() {
//        // Sample questions with options
//        questionList = [
//            ("What is your favorite color?", ["Red", "Blue", "Green", "Yellow"]),
//            ("Which programming language do you prefer?", ["Swift", "Java", "Python", "JavaScript"]),
//            ("What is your favorite animal?", ["Dog", "Cat", "Elephant", "Dolphin"]),
//            ("In which season were you born?", ["Spring", "Summer", "Fall", "Winter"]),
//            ("What is your preferred mode of transportation?", ["Car", "Bicycle", "Bus", "Walking"])
//        ]
//
//        // Initialize selected options with nil for each question
//        selectedOptions = Array(repeating: nil, count: questionList.count)
//    }
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//
//    }
//    func setupUI() {
//        // Question Label
//
//        questionText.textColor = .black
//        questionText.numberOfLines = 0
//        questionText.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(questionText)
//
//        // Table view
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(tableView)
//
//        // Previous button
//        let previousButton = UIButton()
//        previousButton.setTitle("Previous", for: .normal)
//        previousButton.setTitleColor(.blue, for: .normal)
//        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
//        previousButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(previousButton)
//
//        // Next button
//        let nextButton = UIButton()
//        nextButton.setTitle("Next", for: .normal)
//        nextButton.setTitleColor(.blue, for: .normal)
//        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
//        nextButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(nextButton)
//
//        // Submit button
//        let submitButton = UIButton()
//        submitButton.setTitle("Submit", for: .normal)
//        submitButton.setTitleColor(.green, for: .normal)
//        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
//        submitButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(submitButton)
//
//        // Reset button
//        let resetButton = UIButton()
//        resetButton.setTitle("Reset", for: .normal)
//        resetButton.setTitleColor(.red, for: .normal)
//        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
//        resetButton.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(resetButton)
//
//        // Layout constraints
//        NSLayoutConstraint.activate([
//            questionText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
//            questionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//            questionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
//
//            tableView.topAnchor.constraint(equalTo: questionText.bottomAnchor, constant: 20),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
//
//            previousButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
//            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
//
//            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
//            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//
//            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
//
//            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
//        ])
//
//        updateUIForCurrentQuestion()
//    }
//
//    func updateUIForCurrentQuestion() {
//        let currentQuestion = questionList[currentQuestionIndex]
//        questionText.text = currentQuestion.question
//        title = "Question \(currentQuestionIndex + 1)"
//
//    }
//
//    @objc func previousButtonTapped() {
//        if currentQuestionIndex > 0 {
//            currentQuestionIndex -= 1
//            updateUIForCurrentQuestion()
//            tableView.reloadData()
//        }
//    }
//
//    @objc func nextButtonTapped() {
//        if currentQuestionIndex < questionList.count - 1 {
//            currentQuestionIndex += 1
//            updateUIForCurrentQuestion()
//            tableView.reloadData()
//        }
//    }
//
//    @objc func submitButtonTapped() {
//        submitResponse()
//    }
//
//    @objc func resetButtonTapped() {
//        resetSelections()
//    }
//
//    func submitResponse() {
//        for (index, question) in questionList.enumerated() {
//            let selectedOption = selectedOptions[index] ?? "Not answered"
//            print("Question \(index + 1): \(question.question) - Selected Option: \(selectedOption)")
//        }
//        // Add your API call here to submit the responses
//    }
//
//    func resetSelections() {
//        selectedOptions = Array(repeating: nil, count: questionList.count)
//        tableView.reloadData()
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return questionList[currentQuestionIndex].options.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MultipleChoiceCell else {
//            return UITableViewCell()
//        }
//
//        cell.layer.cornerRadius = 10
//        cell.layer.borderWidth = 2
//        cell.layer.borderColor = UIColor.gray.cgColor
//        cell.layer.shadowColor = UIColor.magenta.cgColor
//        cell.textLabel?.text = questionList[currentQuestionIndex].options[indexPath.row]
//        cell.radioButton.isSelected =  (questionList[currentQuestionIndex].options[indexPath.row] == selectedOptions[currentQuestionIndex])
//
//
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView()
//            // 2
//        footerView.backgroundColor = view.backgroundColor
//            // 3
//        return footerView
//    }
//
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // Handle cell selection here
//        selectedOptions[currentQuestionIndex] = questionList[currentQuestionIndex].options[indexPath.row]
//        tableView.reloadData()
//    }
//
//}
//
//class MultipleChoiceCell: UITableViewCell {
//    let radioButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(systemName: "circle"), for: .normal)
//        button.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .selected)
//        button.isUserInteractionEnabled = false
//        return button
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        setupUI()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        setupUI()
//    }
//
//
//
//
//    private func setupUI() {
//        contentView.addSubview(radioButton)
//
//        // Add additional UI elements as needed
//        let padding: CGFloat = 8.0
//
//        // Layout constraints for the radio button
//        radioButton.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            radioButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
//            radioButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            radioButton.widthAnchor.constraint(equalToConstant: 24),
//            radioButton.heightAnchor.constraint(equalToConstant: 24),
//        ])
//
//        // Layout constraints for the text label
//        textLabel?.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            textLabel!.leadingAnchor.constraint(equalTo: radioButton.trailingAnchor, constant: padding),
//            textLabel!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
//            textLabel!.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//        ])
//    }
//}


//-----------------------


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableView = UITableView()
    var questionList: [(question: String, trainers: [String], selectedFeedback: [String?])] = []
    var currentQuestionIndex: Int = 0
    var questionText = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupQuestionList()
        setupUI()

        tableView.register(TrainerFeedbackCell.self, forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()
        tableView.dataSource = self
        tableView.delegate = self
    }

    func setupQuestionList() {
        // Sample questions with options
        questionList = [
            ("What is your favorite color?", ["Trainer A", "Trainer B", "Trainer C"], selectedFeedback: Array(repeating: nil, count: 3)),
            ("Which programming language do you prefer Which programming language do you prefer?", ["Trainer X", "Trainer Y", "Trainer Z"], selectedFeedback: Array(repeating: nil, count: 3)),
            // Add more questions and trainers as needed
        ]
    }

    func setupUI() {
        // Question container view
        
        let questionContainerView = UIView()
        questionContainerView.layer.cornerRadius = 10
        questionContainerView.layer.borderWidth = 0.5
        questionContainerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionContainerView)
        
        // Question Label
        questionText.textColor = .black
        
        questionText.numberOfLines = 0
        questionText.translatesAutoresizingMaskIntoConstraints = false
        questionContainerView.addSubview(questionText)
        
        

        // Table view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)

        // Previous button
        let previousButton = UIButton()
        previousButton.setTitle("Previous", for: .normal)
        previousButton.setTitleColor(.blue, for: .normal)
        previousButton.addTarget(self, action: #selector(previousButtonTapped), for: .touchUpInside)
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(previousButton)

        // Next button
        let nextButton = UIButton()
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nextButton)

        // Submit button
        let submitButton = UIButton()
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(.green, for: .normal)
        submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)

        // Reset button
        let resetButton = UIButton()
        resetButton.setTitle("Reset", for: .normal)
        resetButton.setTitleColor(.red, for: .normal)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resetButton)
        
        let padding = 10.0
        // Layout constraints
        NSLayoutConstraint.activate([
            questionContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            questionContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            questionContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            questionContainerView.bottomAnchor.constraint(greaterThanOrEqualTo: questionText.bottomAnchor, constant: padding),

            questionText.topAnchor.constraint(equalTo: questionContainerView.topAnchor, constant: padding),
            questionText.leadingAnchor.constraint(equalTo: questionContainerView.leadingAnchor, constant: padding),
            questionText.trailingAnchor.constraint(equalTo: questionContainerView.trailingAnchor, constant: -padding),

            tableView.topAnchor.constraint(equalTo: questionText.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),

            previousButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            nextButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
        ])

        updateUIForCurrentQuestion()
    }

    func updateUIForCurrentQuestion() {
        let currentQuestion = questionList[currentQuestionIndex]
        questionText.text = currentQuestion.question
        title = "Question \(currentQuestionIndex + 1)"
    }

    @objc func previousButtonTapped() {
        if currentQuestionIndex > 0 {
            currentQuestionIndex -= 1
            updateUIForCurrentQuestion()
            tableView.reloadData()
        }
    }

    @objc func nextButtonTapped() {
        if currentQuestionIndex < questionList.count - 1 {
            currentQuestionIndex += 1
            updateUIForCurrentQuestion()
            tableView.reloadData()
        }
    }

    @objc func submitButtonTapped() {
        submitResponse()
    }

    @objc func resetButtonTapped() {
        resetSelections()
    }

    func submitResponse() {
        for (index, question) in questionList.enumerated() {
            let selectedFeedback = question.selectedFeedback.compactMap { $0 }
            print("Question \(index + 1): \(question.question) - Selected Feedback: \(selectedFeedback.joined(separator: ", "))")
        }
        // Add your API call here to submit the responses
    }

    func resetSelections() {
        for i in 0..<questionList[currentQuestionIndex].selectedFeedback.count {
            questionList[currentQuestionIndex].selectedFeedback[i] = nil
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionList[currentQuestionIndex].trainers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TrainerFeedbackCell else {
            return UITableViewCell()
        }

        let trainer = questionList[currentQuestionIndex].trainers[indexPath.row]
        let selectedFeedback = questionList[currentQuestionIndex].selectedFeedback[indexPath.row]
        cell.textLabel?.text = trainer
        cell.feedbackButton.setTitle(selectedFeedback ?? "Select Feedback", for: .normal)
        cell.feedbackButton.tag = indexPath.row
        cell.feedbackButton.addTarget(self, action: #selector(feedbackButtonTapped(_:)), for: .touchUpInside)

        return cell
    }

    @objc func feedbackButtonTapped(_ sender: UIButton) {
        let trainerIndex = sender.tag
        let feedbackOptions = ["Not Good", "Good", "Best", "Excellent"]

        let feedbackSelectionVC = FeedbackSelectionViewController(options: feedbackOptions) { selectedFeedback in
            self.questionList[self.currentQuestionIndex].selectedFeedback[trainerIndex] = selectedFeedback
            self.tableView.reloadData()
        }

        present(feedbackSelectionVC, animated: true, completion: nil)
    }
}

class TrainerFeedbackCell: UITableViewCell {
    let feedbackButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(feedbackButton)

        // Add additional UI elements as needed
        let padding: CGFloat = 8.0

        // Layout constraints for the feedback button
        feedbackButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            feedbackButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            feedbackButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            feedbackButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}

class FeedbackSelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private let tableView = UITableView()
    private let selectOptionLbl = UILabel()
    private let options: [String]
    private let selectionHandler: (String) -> Void

    init(options: [String], selectionHandler: @escaping (String) -> Void) {
        self.options = options
        self.selectionHandler = selectionHandler
        super.init(nibName: nil, bundle: nil)

        modalPresentationStyle = .overCurrentContext
        modalTransitionStyle = .crossDissolve
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "feedbackCell")
        tableView.dataSource = self
        tableView.delegate = self
        setupView()
       
    }
    private func setupView() {
        // Container view to center the pop-up
        let containerView = UIView()
        containerView.backgroundColor = .white
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.layer.cornerRadius = 10
        containerView.clipsToBounds = true
        view.addSubview(containerView)

        // Layout constraints for the container view
        NSLayoutConstraint.activate([
            containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            containerView.widthAnchor.constraint(equalToConstant: view.bounds.width - 32),
            containerView.heightAnchor.constraint(equalToConstant: min(300, CGFloat(options.count) * 44.0 + 100))  // Adjust the height as needed
        ])
        
        

        // Layout constraints for the title label
        selectOptionLbl.text = "Please Select Feedback for Trainer"
        selectOptionLbl.textColor = .black
        selectOptionLbl.textAlignment = .center
        selectOptionLbl.backgroundColor = .white
        selectOptionLbl.font = UIFont.boldSystemFont(ofSize: 16)
        selectOptionLbl.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(selectOptionLbl)
        
        // divider
        
        let divider = UIView()
        divider.backgroundColor = .gray
        divider.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(divider)
        

        // Layout constraints for the table view
        tableView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(tableView)

        NSLayoutConstraint.activate([
            // Constraints for the title label
            selectOptionLbl.topAnchor.constraint(equalTo: containerView.topAnchor),
            selectOptionLbl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            selectOptionLbl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            selectOptionLbl.heightAnchor.constraint(equalToConstant: 40),
            
            divider.topAnchor.constraint(equalTo: selectOptionLbl.bottomAnchor, constant: 5),
            divider.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            divider.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            divider.heightAnchor.constraint(equalToConstant: 2),

            // Constraints for the table view
            tableView.topAnchor.constraint(equalTo: divider.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        ])
    }







    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return options.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "feedbackCell", for: indexPath)
        cell.textLabel?.text = options[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedFeedback = options[indexPath.row]
        selectionHandler(selectedFeedback)
        dismiss(animated: true, completion: nil)
    }
}
