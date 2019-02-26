// This source file is part of the https://github.com/ColdGrub1384/Pisth open source project
//
// Copyright (c) 2017 - 2018 Adrian Labbé
// Licensed under Apache License v2.0
//
// See https://raw.githubusercontent.com/ColdGrub1384/Pisth/master/LICENSE for license information

import UIKit

/// Git branches table view controller to display Git remote branches at `repoPath`.
class GitRemotesTableViewController: GitBranchesTableViewController {
    
    override func viewDidLoad() {
        
        tableView.backgroundView = UIActivityIndicatorView(style: .gray)
        (tableView.backgroundView as? UIActivityIndicatorView)?.startAnimating()
        tableView.tableFooterView = UIView()
        navigationItem.setRightBarButtonItems(nil, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.global(qos: .background).async {
            _ = ConnectionManager.shared.filesSession!.channel.execute("git -C '\(self.repoPath!)' remote update --prune", error: nil)
            
            var error: NSError?
            let result = ConnectionManager.shared.filesSession!.channel.execute("git -C '\(self.repoPath!)' branch -r", error: &error)
            if error == nil {
                for branch in result.components(separatedBy: "\n") {
                    if !branch.contains("/HEAD ") && branch.replacingOccurrences(of: " ", with: "") != "" {
                        self.branches.append(branch.replacingOccurrences(of: " ", with: ""))
                    }
                }
            }
            
            DispatchQueue.main.async {
                self.tableView.backgroundView = nil
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "branch", for: indexPath)
        
        guard let title = cell.viewWithTag(1) as? UILabel else { return cell }
        guard let isCurrent = cell.viewWithTag(2) as? UILabel else { return cell }
        
        title.text = branches[indexPath.row]
        isCurrent.isHidden = (current != branches[indexPath.row])
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let handler = selectionHandler {
            handler(self, indexPath)
            return
        }
        
        launch(command: "git -C '\(repoPath!)' log --graph \(branches[indexPath.row])", withTitle: "Commits for \(branches[indexPath.row])")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Storyboard
    
    override class func makeViewController() -> GitRemotesTableViewController {
        return UIStoryboard(name: "Git", bundle: nil).instantiateViewController(withIdentifier: "remoteBranches") as! GitRemotesTableViewController
    }
}
