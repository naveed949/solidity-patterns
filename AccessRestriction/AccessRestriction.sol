// This code has not been professionally audited, therefore I cannot make any promises about
// safety or correctness. Use at own risk.

/**
 * @title AccessRestriction
 * @dev This contract demonstrates how to use access restriction modifiers in Solidity.
 * It allows the owner of the contract to change ownership and sell the contract to a new owner,
 * but only under certain conditions.
 */
pragma solidity ^0.4.21;

contract AccessRestriction {

    address public owner = msg.sender;
    uint public lastOwnerChange = now;

    /**
     * @dev Restricts access to a function to a specific address.
     * @param _account The address that is allowed to access the function.
     */
    modifier onlyBy(address _account) {
        require(msg.sender == _account);
        _;
    }

    /**
     * @dev Restricts access to a function until a certain time has passed.
     * @param _time The timestamp that must be reached before allowing access to the function.
     */
    modifier onlyAfter(uint _time) {
        require(now >= _time);
        _;
    }

    /**
     * @dev Restricts access to a function based on the amount of Ether sent with the function call.
     * @param _amount The minimum amount of Ether required to access the function.
     */
    modifier costs(uint _amount) {
        require(msg.value >= _amount);
        _;
        if (msg.value > _amount) {
            msg.sender.transfer(msg.value - _amount);
        }
    }

    /**
     * @dev Allows the current owner of the contract to change ownership to a new address.
     * @param _newOwner The address of the new owner of the contract.
     */
    function changeOwner(address _newOwner) public onlyBy(owner) {
        owner = _newOwner;
    }

    /**
     * @dev Allows anyone to buy the contract from the current owner, but only after a certain amount of time has passed since the last ownership change and for a specific amount of Ether.
     */
    function buyContract() public payable onlyAfter(lastOwnerChange + 4 weeks) costs(1 ether) {
        owner = msg.sender;
        lastOwnerChange = now;
    }
}