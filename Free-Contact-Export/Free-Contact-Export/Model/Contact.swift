//
//  Contact.swift
//  Free-Contact-Export
//
//  Created by Maneesh M on 10/09/22.
//

import Contacts

struct Contact: Identifiable {
    var id: String { contact.identifier }
    var firstName:String { contact.givenName }
    var lastName:String { contact.familyName }
    var phones:[String?] { contact.phoneNumbers.map(\.value.stringValue) }
    
    let contact:CNContact
    
    static func fetchAll(_ completion: @escaping (Result<[Contact], Error> )-> () ) {
        let containerId = CNContactStore().defaultContainerIdentifier()
        let predicate = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
        
        let descriptor = [
            CNContactIdentifierKey,
            CNContactGivenNameKey,
            CNContactFamilyNameKey,
            CNContactPhoneNumbersKey
        ]
        as [CNKeyDescriptor]
        
        do {
            let rawContacts = try CNContactStore().unifiedContacts(matching: predicate, keysToFetch: descriptor)
            completion(.success(rawContacts.map({ .init(contact: $0)})))
        } catch {
            completion(.failure(error))
        }
        
        
    }
}

enum PermisionError: Identifiable {
    var id: String { UUID().uuidString }
    
    case userError
    case fetchError(_: Error)
    
    var description: String {
        switch self {
        case .userError:
            return "Please change permission in settings"
        case .fetchError(let error):
            return error.localizedDescription
        }
    }
}
