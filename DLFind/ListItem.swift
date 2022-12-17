//
//  ListItem.swift
//  DLFind
//
//  Created by David Empire on 12/23/22.
//

import CoreData

class ListItem: NSManagedObject {
    @NSManaged var name: String
    @NSManaged var order: Int
}

extension ListItem {
    static func getListItemFetchRequest() -> NSFetchRequest<ListItem>{
        let request = ListItem.fetchRequest() as! NSFetchRequest<ListItem>
        request.sortDescriptors = [NSSortDescriptor(key: "order", ascending: true)]
        return request
    }
}
