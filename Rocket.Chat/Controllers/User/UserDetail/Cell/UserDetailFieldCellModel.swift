//
//  UserDetailFieldCellModel.swift
//  Rocket.Chat
//
//  Created by Matheus Cardoso on 6/27/18.
//  Copyright © 2018 Rocket.Chat. All rights reserved.
//

import Foundation

struct UserDetailFieldCellModel {
    let title: String
    let detail: String
}

// MARK: Empty State

extension UserDetailFieldCellModel {
    static var emptyState: UserDetailFieldCellModel {
        return UserDetailFieldCellModel(title: "", detail: "")
    }
}

// MARK: User

extension UserDetailFieldCellModel {
    static func cellsForUser(_ user: User) -> [UserDetailFieldCellModel] {
        var cells = [UserDetailFieldCellModel]()
        let createCell = UserDetailFieldCellModel.init

        if !user.roles.isEmpty {
            let roles = user.roles.reduce("") { "\($0), \($1)" }
            cells.append(createCell(roles.count > 1 ? "Role" : "Roles", roles))
        }

        if !user.emails.isEmpty {
            let emails = user.emails.reduce("") { "\($0), \($1)" }
            cells.append(createCell(emails.count > 1 ? "Email" : "Emails", emails))
        }

        if let offset = user.utcOffset {
            cells.append(createCell("Timezone", "(GMT +\(offset))"))
        }

        return cells
    }
}