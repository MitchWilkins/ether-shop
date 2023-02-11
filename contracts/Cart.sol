// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Cart {
    struct Product {
        string name;
        uint256 price;
        uint256 quantity;
    }

    Product[] private products;

    uint cartId = uint(keccak256(abi.encodePacked(block.timestamp, msg.sender, uint(0))));

    constructor() {
        createCart();
    }

    event CreatedCart(uint256 cartId);

    event Inserted(Product product);

    event GetProducts(Product[] products);

    function insert(
        string calldata name,
        uint256 price,
        uint256 quantity
    ) public {
        Product memory product = Product(name, price, quantity);
        products.push(product);
        emit Inserted(product);
    }

    function createCart() private returns (uint) {
        emit CreatedCart(cartId);
        return cartId;
    }

    function getCartId() public view returns (uint256) {
        return cartId;
    }

    function getProducts() public returns (Product[] memory) {
        emit GetProducts(products);
        return products;
    }
