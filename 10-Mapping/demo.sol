// SPDX-License-Identifier: MIT
pragma solidity >=0.4.0 <0.9.0;

/**
 * @title Mapping Demonstration in Solidity
 * @dev Shows how to use mappings to store and retrieve data efficiently
 * @notice Mappings are key-value stores where keys map to values
 * @notice Analogous to hash tables or dictionaries in other languages
 * @notice All mappings in Solidity are virtual - they don't store all keys, just the ones that have been set
 */
contract mapDemo {
    /**
     * @dev Mapping from uint256 keys to string values
     * @notice Public visibility automatically creates a getter function
     * @notice Example use case: mapping student roll numbers (keys) to student names (values)
     * @notice Keys are unique - setting a key twice overwrites the previous value
     *
     * @dev Storage Characteristics:
     * - Doesn't occupy storage slots for unused keys
     * - Keys are hashed to find the storage location
     * - No length or way to enumerate keys
     * - Very gas efficient for access (O(1) complexity)
     */
    mapping(uint256 => string) public roll_no;

    /**
     * @dev Sets a value in the roll_no mapping
     * @param _key The uint256 key (e.g., student roll number)
     * @param _value The string value to associate with the key (e.g., student name)
     * @notice Demonstrates how to store values in a mapping
     * @dev Gas cost: ~20,000-40,000 (varies based on storage operations)
     */
    function setter(uint256 _key, string memory _value) public {
        // Assign the value to the specified key in the mapping
        // If the key already exists, this overwrites the previous value
        roll_no[_key] = _value;
    }

    /**
     * @dev Student struct to store multiple pieces of information
     * @notice Shows how to define a custom data structure
     * @notice Contains class (uint) and name (string) fields
     */
    struct Student {
        uint256 class;   // Class/grade the student is in
        string name;     // Student's name
    }

    /**
     * @dev Mapping from uint keys to Student struct values
     * @notice Demonstrates using complex types (structs) as mapping values
     * @notice Public visibility creates a getter that returns the entire struct
     */
    mapping(uint256 => Student) public data;

    /**
     * @dev Sets student data in the mapping
     * @param _roll The student's roll number (key)
     * @param class The class/grade the student is in
     * @param name The student's name
     * @notice Shows how to store struct values in a mapping
     * @dev Gas cost: ~40,000-60,000 (higher due to struct storage)
     */
    function dataSetter(uint256 _roll, uint256 class, string memory name) public {
        // Create a new Student struct and assign it to the mapping
        // This overwrites any existing value at this key
        data[_roll] = Student({
            class: class,
            name: name
        });

        // Alternative syntax that would also work:
        // data[_roll] = Student(class, name);
    }

    /**
     * @dev Gets a value from the roll_no mapping
     * @param _key The key to look up
     * @return The string value associated with the key, or empty string if not set
     * @notice Explicit getter function (though public mapping already provides one)
     */
    function getRollNo(uint256 _key) public view returns (string memory) {
        return roll_no[_key];
    }

    /**
     * @dev Gets student data from the mapping
     * @param _roll The student's roll number
     * @return The class and name of the student
     * @notice Shows how to retrieve struct data from a mapping
     */
    function getStudentData(uint256 _roll) public view returns (uint256, string memory) {
        Student memory student = data[_roll];
        return (student.class, student.name);
    }

    /**
     * @dev Checks if a key exists in the roll_no mapping
     * @param _key The key to check
     * @return true if the key has a non-empty value, false otherwise
     * @notice Demonstrates how to check for key existence
     * @dev Note: There's no direct way to check if a key exists - we check if the value is empty
     */
    function keyExists(uint256 _key) public view returns (bool) {
        return bytes(roll_no[_key]).length > 0;
    }

    /**
     * @dev Removes a key-value pair from the roll_no mapping
     * @param _key The key to remove
     * @notice Sets the value to empty string, effectively removing the mapping entry
     * @dev Note: The key still exists in the mapping but maps to an empty value
     */
    function removeKey(uint256 _key) public {
        delete roll_no[_key];
        // Alternative that would also work:
        // roll_no[_key] = "";
    }

    /**
     * @dev Updates the class of an existing student
     * @param _roll The student's roll number
     * @param newClass The new class to assign
     * @notice Shows how to update specific fields in a struct stored in a mapping
     * @dev Requires the student to already exist in the mapping
     */
    function updateStudentClass(uint256 _roll, uint256 newClass) public {
        // Check that the student exists
        require(bytes(data[_roll].name).length > 0, "Student does not exist");

        // Update just the class field
        data[_roll].class = newClass;
    }

    /**
     * @dev Updates the name of an existing student
     * @param _roll The student's roll number
     * @param newName The new name to assign
     * @notice Shows how to update specific fields in a struct stored in a mapping
     */
    function updateStudentName(uint256 _roll, string memory newName) public {
        // Check that the student exists
        require(bytes(data[_roll].name).length > 0, "Student does not exist");

        // Update just the name field
        data[_roll].name = newName;
    }
}

/*
MAPPING RULES AND CHARACTERISTICS:

1. Key Types:
   - Can be any built-in value type (uint, address, bytes, etc.)
   - CANNOT be:
     * Mappings
     * Dynamically-sized arrays
     * Contract types
     * Enums
     * Structs
     * Any reference type in memory

2. Value Types:
   - Can be any type including:
     * Mappings (though nested mappings have special syntax)
     * Arrays
     * Structs
     * Any other type

3. Storage Characteristics:
   - Mappings don't actually store all possible keys
   - They use a hash function to compute the storage location for each key
   - Only the keys that have been set occupy storage
   - Cannot be iterated over (no way to get all keys)
   - No length or size concept

4. Syntax for Nested Mappings:
   mapping(uint => mapping(address => bool)) public nestedMap;

5. Gas Considerations:
   - Reading from a mapping: ~100 gas (very cheap)
   - Writing to a mapping: ~20,000 gas (standard storage write)
   - Clearing a mapping value: refund of ~15,000 gas

6. Initialization:
   - Mappings cannot be initialized in their declaration
   - They start "empty" and are populated as keys are set

7. Visibility:
   - Public mappings automatically get getter functions
   - The getter for a value type returns that type
   - The getter for a struct returns the entire struct

8. Common Use Cases:
   - Associating data with addresses (balances, permissions)
   - Creating lookup tables (ID to data mappings)
   - Implementing sparse data structures
*/
