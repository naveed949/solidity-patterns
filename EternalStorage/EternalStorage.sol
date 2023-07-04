// This code has not been professionally audited, therefore I cannot make any promises about
// safety or correctness. Use at own risk.

pragma solidity 0.4.21;

/**
 * @title EternalStorage
 * @dev This contract provides a generic storage mechanism for Solidity contracts.
 * It allows contracts to store and retrieve values of various types using a key-value mapping.
 * The contract owner can upgrade the storage mechanism to a new version by specifying the address of the new version contract.
 */
contract EternalStorage {

    address owner = msg.sender; // The address of the contract owner
    address latestVersion; // The address of the latest version of the contract

    // Key-value mappings for storing values of various types
    mapping(bytes32 => uint) uIntStorage;
    mapping(bytes32 => string) stringStorage;
    mapping(bytes32 => address) addressStorage;
    mapping(bytes32 => bytes) bytesStorage;
    mapping(bytes32 => bool) boolStorage;
    mapping(bytes32 => int) intStorage;

    /**
     * @dev Modifier that restricts access to certain functions to the latest version contract.
     */
    modifier onlyLatestVersion() {
       require(msg.sender == latestVersion);
        _;
    }

    /**
     * @dev Upgrades the storage mechanism to a new version contract.
     * Only the contract owner can call this function.
     * @param _newVersion The address of the new version contract.
     */
    function upgradeVersion(address _newVersion) public {
        require(msg.sender == owner);
        latestVersion = _newVersion;
    }

    // *** Getter Methods ***

    /**
     * @dev Returns the `uint` value stored at the specified key.
     * @param _key The key of the value to retrieve.
     * @return The `uint` value stored at the specified key.
     */
    function getUint(bytes32 _key) external view returns(uint) {
        return uIntStorage[_key];
    }

    /**
     * @dev Returns the `string` value stored at the specified key.
     * @param _key The key of the value to retrieve.
     * @return The `string` value stored at the specified key.
     */
    function getString(bytes32 _key) external view returns(string) {
        return stringStorage[_key];
    }

    /**
     * @dev Returns the `address` value stored at the specified key.
     * @param _key The key of the value to retrieve.
     * @return The `address` value stored at the specified key.
     */
    function getAddress(bytes32 _key) external view returns(address) {
        return addressStorage[_key];
    }

    /**
     * @dev Returns the `bytes` value stored at the specified key.
     * @param _key The key of the value to retrieve.
     * @return The `bytes` value stored at the specified key.
     */
    function getBytes(bytes32 _key) external view returns(bytes) {
        return bytesStorage[_key];
    }

    /**
     * @dev Returns the `bool` value stored at the specified key.
     * @param _key The key of the value to retrieve.
     * @return The `bool` value stored at the specified key.
     */
    function getBool(bytes32 _key) external view returns(bool) {
        return boolStorage[_key];
    }

    /**
     * @dev Returns the `int` value stored at the specified key.
     * @param _key The key of the value to retrieve.
     * @return The `int` value stored at the specified key.
     */
    function getInt(bytes32 _key) external view returns(int) {
        return intStorage[_key];
    }

    // *** Setter Methods ***

    /**
     * @dev Stores the specified `uint` value at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to store.
     * @param _value The `uint` value to store.
     */
    function setUint(bytes32 _key, uint _value) onlyLatestVersion external {
        uIntStorage[_key] = _value;
    }

    /**
     * @dev Stores the specified `string` value at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to store.
     * @param _value The `string` value to store.
     */
    function setString(bytes32 _key, string _value) onlyLatestVersion external {
        stringStorage[_key] = _value;
    }

    /**
     * @dev Stores the specified `address` value at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to store.
     * @param _value The `address` value to store.
     */
    function setAddress(bytes32 _key, address _value) onlyLatestVersion external {
        addressStorage[_key] = _value;
    }

    /**
     * @dev Stores the specified `bytes` value at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to store.
     * @param _value The `bytes` value to store.
     */
    function setBytes(bytes32 _key, bytes _value) onlyLatestVersion external {
        bytesStorage[_key] = _value;
    }

    /**
     * @dev Stores the specified `bool` value at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to store.
     * @param _value The `bool` value to store.
     */
    function setBool(bytes32 _key, bool _value) onlyLatestVersion external {
        boolStorage[_key] = _value;
    }

    /**
     * @dev Stores the specified `int` value at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to store.
     * @param _value The `int` value to store.
     */
    function setInt(bytes32 _key, int _value) onlyLatestVersion external {
        intStorage[_key] = _value;
    }

    // *** Delete Methods ***

    /**
     * @dev Deletes the `uint` value stored at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to delete.
     */
    function deleteUint(bytes32 _key) onlyLatestVersion external {
        delete uIntStorage[_key];
    }

    /**
     * @dev Deletes the `string` value stored at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to delete.
     */
    function deleteString(bytes32 _key) onlyLatestVersion external {
        delete stringStorage[_key];
    }

    /**
     * @dev Deletes the `address` value stored at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to delete.
     */
    function deleteAddress(bytes32 _key) onlyLatestVersion external {
        delete addressStorage[_key];
    }

    /**
     * @dev Deletes the `bytes` value stored at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to delete.
     */
    function deleteBytes(bytes32 _key) onlyLatestVersion external {
        delete bytesStorage[_key];
    }

    /**
     * @dev Deletes the `bool` value stored at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to delete.
     */
    function deleteBool(bytes32 _key) onlyLatestVersion external {
        delete boolStorage[_key];
    }

    /**
     * @dev Deletes the `int` value stored at the specified key.
     * Only the latest version contract can call this function.
     * @param _key The key of the value to delete.
     */
    function deleteInt(bytes32 _key) onlyLatestVersion external {
        delete intStorage[_key];
    }
}