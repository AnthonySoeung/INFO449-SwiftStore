//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name: String {get};
    func price() -> Int;
}

class Item: SKU {
    let name: String;
    private let unitPrice: Int;

    init(name: String, priceEach: Int) {
        self.name = name;
        self.unitPrice = priceEach;
    }

    func price() -> Int {
        return unitPrice;
    }
}


class Receipt {
    private var itemsScanned: [SKU] = [];
    
    func add(_ item: SKU) {
        itemsScanned.append(item);
    }
    func items() -> [SKU] {
        return itemsScanned;
    }
    func subtotal() -> Int {
        var total = 0;
        for item in itemsScanned {
            total = total + item.price();
        }
        return total;
    }
    func output() -> String {
        var result = "";
        result += "Receipt:\n";

        for item in itemsScanned {
            let dollars = Double(item.price()) / 100.0
            result += "\(item.name): $\(String(format: "%.2f", dollars))\n";
        }

        result += "------------------\n";

        let totalDollars = Double(subtotal()) / 100.0
        result += "TOTAL: $\(String(format: "%.2f", totalDollars))";

        return result;
    }


    func total() -> Int {
        return subtotal();
    }
}

class Register {
    private var receipt: Receipt;
    init() {
        self.receipt = Receipt();
    }
    func scan(_ sku: SKU) {
        receipt.add(sku);
    }
    func subtotal() -> Int {
        return receipt.subtotal();
    }
    func total() -> Receipt {
        let finishedReceipt = receipt;
        receipt = Receipt();
        return finishedReceipt;
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

