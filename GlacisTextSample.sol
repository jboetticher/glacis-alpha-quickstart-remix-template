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

GlacisRouter on BSC    Testnet: 0x7B46E11429F51fb1E4324273fa26CF92c63Df18d
GlacisRouter on Avalanche Fuji: 0x1Ce678F0e7834713868877C34F84C2cfaf511aFe

BSC   Testnet  ChainID: 97
Avalanche Fuji ChainID: 43113

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
