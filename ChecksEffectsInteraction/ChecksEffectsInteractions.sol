// This code has not been professionally audited, therefore I cannot make any promises about
// safety or correctness. Use at own risk.

/**
 * @title ChecksEffectsInteractions
 * @dev This contract demonstrates the importance of the checks-effects-interactions pattern in Solidity.
 * It allows users to deposit and withdraw Ether from their account balance, but only if they have sufficient funds.
 */
pragma solidity ^0.4.21;

contract ChecksEffectsInteractions {

    mapping(address => uint) balances;

    /**
     * @dev Deposits Ether into the user's account balance in the contract.
     */
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    /**
     * @dev Withdraws a specified amount of Ether from the user's account balance of the contract.
     * @param amount The amount of Ether to withdraw.
     */
    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount); // Check

        balances[msg.sender] -= amount; // Effect

        msg.sender.transfer(amount); // Interaction
    }
}
