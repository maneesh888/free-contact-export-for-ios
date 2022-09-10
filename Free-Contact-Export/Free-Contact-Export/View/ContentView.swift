//
//  ContentView.swift
//  Free-Contact-Export
//
//  Created by Maneesh M on 10/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject
    private var contactsVM = ContactsViewModel()
    
    
    
    var body: some View {
        NavigationView {
            List {
                ForEach( contactsVM.contacts ) { contact in
                    VStack( alignment: .leading ) {
                        HStack {
                            Label(contact.firstName, systemImage: "person.crop.circle")
                            Text(contact.lastName).bold()
                            Divider()
                            Label(((contact.phones.first ?? "Not Provided")!) , systemImage: "apps.phone")
                        }.padding()
                            .background(Color.secondary.opacity(0.25))
                            .clipShape(RoundedRectangle(cornerRadius: 15.0,style: .continuous))
                    }
                }
                
            }.navigationTitle( contactsVM.contacts.count == 0 ? "Import Contact" : "Contacts")
                .navigationBarTitleDisplayMode(.inline)
        }
        .alert(item:$contactsVM.permissionsError) { _ in
            Alert(title: Text("Permission denided"), message: Text(contactsVM.permissionsError?.description ?? "Unknown error"), dismissButton: .default(Text("OK"), action: {
                contactsVM.openSettings()
            }))
        }
    }
    
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
