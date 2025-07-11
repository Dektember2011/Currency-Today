//
//  Convert.swift
//  Currency Today
//
//  Created by Student on 02.07.25.
//







import UIKit

class ConvertOption{
    var name: String
    var backgroundImage: UIImage
    var backgroundColor: UIColor
    var api: String
    
    
    init(name: String, backgroundImage: UIImage, backgroundColor: UIColor, api: String) {
        self.name = name
        self.backgroundImage = backgroundImage
        self.backgroundColor = backgroundColor
        self.api = api
    }
    
}





class ConvertViewController: UIViewController {
    
    var models = [ConvertOption]()

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ConvertTableViewCell.self, forCellReuseIdentifier: ConvertTableViewCell.id)
        configure()

       
    }
    
    func configure(){
        models.append(contentsOf: [
            ConvertOption(name: "AMD", backgroundImage: UIImage(named: "arm")!, backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/AMD"),
            ConvertOption(name: "RUB", backgroundImage: UIImage(named: "rus")!, backgroundColor: .systemTeal, api: " https://open.er-api.com/v6/latest/Rus"),
//            ConvertOption(name: "USD", backgroundImage: UIImage(named: "usd")!,/* backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/USD"),*/
            ConvertOption(name: "KZT", backgroundImage: UIImage(named: "kzt")!, backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/KZT"),
            ConvertOption(name: "EUR", backgroundImage: UIImage(named: "euro")!, backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/EUR"),
            ConvertOption(name: "GBP", backgroundImage: UIImage(named: "england")!, backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/GBP"),
            ConvertOption(name: "GRN", backgroundImage: UIImage(named: "ukrain")!, backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/GRN"),
            ConvertOption(name: "JPY", backgroundImage: UIImage(named: "japan")!, backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/JPY"),
            ConvertOption(name: "EUR", backgroundImage: UIImage(named: "germany")!, backgroundColor: .systemTeal, api: " https://open.er-api.com/v6/latest/EUR"),
            ConvertOption(name: "EUR", backgroundImage: UIImage(named: "france")!, backgroundColor: .systemTeal, api: "https://open.er-api.com/v6/latest/EUR")
            
        ])
    }
        
    
    

    @IBAction func ChangeButton(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Change") as? Change
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
        
    }
    
   
        @IBAction func SettingsButton(_ sender: Any) {
            
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Settings") as? Settings
        vc?.modalTransitionStyle = .crossDissolve
        vc?.modalPresentationStyle = .fullScreen
        self.present(vc!, animated: true)
            
    }

}

extension ConvertViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model =  models[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConvertTableViewCell.id, for: indexPath) as? ConvertTableViewCell
        else{
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.tableView.deselectRow(at: indexPath, animated: true)
        if models [indexPath.item].name != ""{
            let vc = storyboard?.instantiateViewController(withIdentifier: "ChangeViewController") as!
            ChangeViewController
            vc.ap = models[indexPath.item].api
            vc.text = models[indexPath.item].name
            self.present(vc, animated:true)
        }
    }
}
