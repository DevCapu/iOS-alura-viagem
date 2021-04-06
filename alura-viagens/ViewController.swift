import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    let listaViagens: [String] = ["Rio de Janeiro", "Ceará", "São Paulo"]
    
    @IBOutlet weak var tabelaViagens: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = listaViagens[indexPath.row]
        
        return cell
    }
}

