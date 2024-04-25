// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import { EncodedModuleTypes } from "contracts/lib/ModuleTypeLib.sol";
import { MODULE_TYPE_HOOK } from "../../../contracts/types/Constants.sol";

contract BadMockHook {
    event PreCheckCalled();
    event PostCheckCalled();

    function onInstall(bytes calldata) external {
        emit PreCheckCalled();
    }

    function onUninstall(bytes calldata) external {
        emit PostCheckCalled();
    }

    function preCheck(
        address,
        uint256,
        bytes calldata
    )
        external
        returns (bytes memory hookData)
    {
        emit PreCheckCalled();
    }

    function isModuleType(uint256 moduleTypeId) external pure returns (bool) {
        return moduleTypeId == MODULE_TYPE_HOOK;
    }

    function getModuleTypes() external view returns (EncodedModuleTypes) { }

    // Review
    function test(uint256 a) public pure {
        a;
    }
}
