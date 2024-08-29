// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.18;

import {GlacisClientOwnable} from "https://github.com/jboetticher/glacis-alpha-quickstart-remix-template/blob/main/GlacisClientContracts/GlacisClientOwnable.sol";

/*
 _______  _        _______  _______ _________ _______ 
(  ____ \( \      (  ___  )(  ____ \\__   __/(  ____ \
| (    \/| (      | (   ) || (    \/   ) (   | (    \/
| |      | |      | (___) || |         | |   | (_____ 
| | ____ | |      |  ___  || |         | |   (_____  )
| | \_  )| |      | (   ) || |         | |         ) |
| (___) || (____/\| )   ( || (____/\___) (___/\____) |
(_______)(_______/|/     \|(_______/\_______/\_______)
*/

/*

GlacisRouter on Avalanche Fuji:   0x1Ce678F0e7834713868877C34F84C2cfaf511aFe
GlacisRouter on Arbitrum Sepolia: 0x51f4510b1488d03A4c8C699fEa3c0B745a042e45

Avalanche  Fuji  ChainID: 43113
Arbitrum Sepolia ChainID: 421614

*/

contract GlacisClientTextSample is GlacisClientOwnable {
    string public currentMessage;

    constructor(
        address glacisRouter_,
        address owner_
    ) GlacisClientOwnable(glacisRouter_, 1, owner_) {}

    function sendMessage(
        address to,
        uint256 chainId,
        string memory message,
        address[] memory adapters,
        CrossChainGas[] memory fees
    ) external payable returns (bytes32, uint256) {
        return
            _route(
                chainId,
                bytes32(uint256(uint160(to))),
                abi.encode(message),
                adapters,
                fees,
                msg.sender,
                false,
                msg.value
            );
    }

    function _receiveMessage(
        address[] memory, // fromAdapters,
        uint256, // fromChainId,
        bytes32, // fromAddress,
        bytes memory payload
    ) internal override {
        (currentMessage) = abi.decode(payload, (string));
    }
}