// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "lib/forge-std/src/Script.sol";
import "../src/DUN.sol";
import "../src/DUNcore.sol";
import "../src/MockERC20.sol"; // Ensure the correct path is set
import "../src/MockAggregator.sol"; // Ensure the correct path is set

contract Deploy is Script {
    function run() external {
        vm.startBroadcast();

        // Deploy the DUN token
        DUN dun = new DUN();

        // Deploy mock WETH and WBTC tokens
        MockERC20 weth = new MockERC20("Wrapped Ether", "WETH");
        MockERC20 wbtc = new MockERC20("Wrapped Bitcoin", "WBTC");

        // Deploy mock price feed contracts
        MockAggregator wethPriceFeed = new MockAggregator(3000 * 10**18); // Initial price of $3000 for WETH
        MockAggregator wbtcPriceFeed = new MockAggregator(50000 * 10**18); // Initial price of $50000 for WBTC

        // Deploy the DUNcore contract
        DUNcore duncore = new DUNcore(
            address(dun),
            address(weth),
            address(wbtc),
            address(wethPriceFeed),
            address(wbtcPriceFeed)
        );

        vm.stopBroadcast();
    }
}
