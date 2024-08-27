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

GlacisRouter on Moonbase Alpha: 0x71917f371210cDA0540bC6770C349AdcedF7FB36
GlacisRouter on Fantom TestNet: 0xe537e0F3e2b0AC8e9C73E940FDDc1Fd53E1F6EB3

Moonbase Alpha ChainID: 1287
Fantom TestNet ChainID: 4002

*/

contract GlacisClientTextSample is GlacisClientOwnable {
    string public currentMessage;

    constructor(
        address glacisRouter_,
        address owner_
    ) GlacisClientOwnable(glacisRouter_, 1, owner_) {}

    function sendMessage(
        bytes32 to,
        uint256 chainId,
        string memory message,
        address[] memory adapters,
        GlacisCommons.CrossChainGas[] memory fees
    ) external payable returns (bytes32) {
        return
            _route(
                chainId,
                to,
                abi.encode(message),
                adapters,
                fees,
                msg.sender,
                false,
                msg.value
            );
    }

    function _receiveMessage(
        address[] calldata, // fromAdapters,
        uint256, // fromChainId,
        bytes32, // fromAddress,
        bytes memory payload
    ) internal override {
        (currentMessage) = abi.decode(payload, (string));
    }
}
