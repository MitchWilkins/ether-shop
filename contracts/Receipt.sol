// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import './Cart.sol';

contract Receipt {

    address private customer;
    address private store;
    Cart private cart;

    event ReceiptGenerated(address customer, address store, Cart cart);

    function generateReceipt(address customerAddress, address storeAddress, Cart customerCart) public {
        customer = customerAddress;
        store = storeAddress;
        cart = customerCart;
    }

    function createCart() public {
        cart = new Cart();
        cart.insert("T-Shirt", 10, 1);
        cart.insert("Pants", 20, 1);

        cart.getProducts();
    }


}
