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

GlacisRouter on Moonbase Alpha: 0x924970b27fACAf088C7FD5A6c09A687d54E27eDE
GlacisRouter on Fantom TestNet: 0x924970b27fACAf088C7FD5A6c09A687d54E27eDE

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
        address to,
        uint256 chainId,
        string memory message,
        uint8[] memory gmps,
        uint256[] memory fees,
    ) external payable returns (bytes32) {
        return
            _route(
                chainId,
                to,
                abi.encode(message),
                gmps,
                fees,
                msg.sender,
                false,
                msg.value
            );
    }

    function _receiveMessage(
        uint8[] calldata, // fromGmpId,
        uint256, // fromChainId,
        address, // fromAddress,
        bytes memory payload
    ) internal override {
        (currentMessage) = abi.decode(payload, (string));
    }
}