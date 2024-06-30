// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import "Lib/forge-std/src/Script.sol";
//import "/Users/yashgarg/Desktop/Defi-unchained/Solidity/src/HelloWorld.sol";
import {HelloWorld} from  "../src/HelloWorld.sol";

contract DeployHelloWorld is Script {
    function run () external returns(HelloWorld){
        vm.startBroadcast();
        HelloWorld helloworld = new HelloWorld();
        vm.stopBroadcast();
        return helloworld;
    }

}

