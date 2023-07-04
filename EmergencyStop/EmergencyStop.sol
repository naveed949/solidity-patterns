// This code has not been professionally audited, therefore I cannot make any promises about
// safety or correctness. Use at own risk.

/**
 * @title EmergencyStop
 * @dev This contract demonstrates how to implement an emergency stop mechanism in Solidity.
 * It allows the contract owner to stop and resume the contract, and restricts access to certain functions
 * based on whether the contract is stopped or not.
 */
pragma solidity ^0.4.21;

contract EmergencyStop {

    bool isStopped = false;

    /**
     * @dev Restricts access to a function when the contract is not stopped.
     */
    modifier stoppedInEmergency {
        require(!isStopped);
        _;
    }

    /**
     * @dev Restricts access to a function when the contract is stopped.
     */
    modifier onlyWhenStopped {
        require(isStopped);
        _;
    }

    /**
     * @dev Restricts access to a function based on authorization of the caller.
     */
    modifier onlyAuthorized {
        // Check for authorization of msg.sender here
        _;
    }

    /**
     * @dev Stops the contract, preventing access to certain functions.
     */
    function stopContract() public onlyAuthorized {
        isStopped = true;
    }

    /**
     * @dev Resumes the contract, allowing access to all functions.
     */
    function resumeContract() public onlyAuthorized {
        isStopped = false;
    }

    /**
     * @dev Allows users to deposit Ether into the contract, but only when the contract is not stopped.
     */
    function deposit() public payable stoppedInEmergency {
        // Deposit logic happening here
    }

    /**
     * @dev Allows users to withdraw Ether from the contract in an emergency, but only when the contract is stopped.
     */
    function emergencyWithdraw() public onlyWhenStopped {
        // Emergency withdraw happening here
    }
}
