import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let listaViagens: [Viagem] = ViagemDAO().retornaTodasAsViagens()
    
    @IBOutlet weak var tabelaViagens: UITableView!
    @IBOutlet weak var hoteisButton: UIView!
    @IBOutlet weak var pacotesButton: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabelaViagens.dataSource = self
        self.tabelaViagens.delegate = self
        
        hoteisButton.layer.cornerRadius = 10
        pacotesButton.layer.cornerRadius = 10
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaViagens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let viagemAtual = listaViagens[indexPath.row]
        
        cell.labelTitulo.text = viagemAtual.titulo
        cell.labelQuantidadeDeDias.text = "\(viagemAtual.quantidadeDeDias) dias"
        cell.labelPreco.text = viagemAtual.preco
    
        cell.imagem.image = UIImage(named: viagemAtual.caminhoDaImagem)
        cell.imagem.layer.cornerRadius = 10
        cell.imagem.layer.masksToBounds = true
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone ? 175 : 450
    }
}

