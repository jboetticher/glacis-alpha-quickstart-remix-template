// SPDX-License-Identifier: Apache-2.0
pragma solidity 0.8.18;

import {XERC20} from "https://github.com/jboetticher/glacis-alpha-quickstart-remix-template/blob/main/GlacisClientContracts/XERC20.sol";

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

contract XERC20Sample is XERC20 {
    constructor(address owner_) XERC20("Sample Token", "SAMPLE", owner_) {
        _mint(owner_, 10 ** 18);
    }
}
