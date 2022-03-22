// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.0;

contract Whitelist {

    // Max # of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // Creat a mapping of whitelisted addressess
    // if an address is whitelisted, we would set it to true, it is false by default
    mapping(address => bool) public whitelistedAddresses;

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    uint8 public numAddressesWhitelisted;

    // Setting the Max number of whitlisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /**
    addAddressToWhitelist - this function adds the address to the sender of
    the whitelist
     */

    function addAddressToWhitelist() public {
        // check if the user is already whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");

        // check if the numAddressesWhitelisted , maxWhitelistedAddresses, if not then throw error
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added");

        // Add the address which called the function to the whitlistedAddress array
        whitelistedAddresses[msg.sender] = true;

        // Increase the number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}