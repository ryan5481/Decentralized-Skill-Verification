// SPDX-License-Identifier: MIT
pragma solidity ^0.8.1;

// userid and company id is an unique natural number representing an account globally
contract DeSkillVerify {
    company[] public companies;
    user[] public employees;
    certificate[] certifications;
    endorsment[] public endorsements;
    skill[] public skills;
    experience[] public experiences;
}

/** ACCOUNTS:
 * LinkedIn OAuth will be used for sign-in/ signup
 * user email id will be mapped to their wallet addresses in the smart contract
 * each sign-in/ signup requires LinkedIn OAuth and wallet address verification
 */

//map user email to wallet address
mapping(string => address) public email_to_address;
// map wallet address to account id
mapping(address => id) public address_to_id;
// map address to bool representing account status(Company/ User)
mapping(address => bool) public is company;

/** User account contains: skills, certifications, work experience
 * employee/ manager
 * manager -> company privileges over employees
 */

struct {
    uint256 id;
    uint256 company_id;
    string name;
    address wallet_address;
    bool is_employed;
    bool is_manager;
    uint256 num_skill;
    uint256[] user_skills;
    uint256[] user_work_experience;

}

struct experience {
    string starting date;
    string ending_date;
    string role;
    bool currently_working;
    uint256 company_id;
    bool is approved;
}

/** SIGNUP
 * Contract takes user email, name, account type.
 * add a new entry to company/ user global array, update new object's paramaters
 * when an account is created, the id -- object index of global array -- is linked to email id and address.
 */

// input string storage location --> call data --> saves gas
function signUp(string calldata email, string calldata name, bool acc_type) public{
    require(email_to_address[email] == address(0),
    "error: user already exists!")
}
email_to_address[email] = msg.sender;

// if sccount type imput is "user" -> create user, push detials, else -> company ...
if(strcmp(acc_type, "user")){
    user storage new_user = employees.push();
    new_user.name = name;
    new_user.id = employees.length -1;
    new_user.wallet_address = msg.sender;
    address_to_id[msg.sender] = new_user.id;
    new_user.user_skills = new uint256[](0);
    new_user.user_work_experience = new uint256[](0);
    } else {
    company storage new_company = companies.push();
    new_company.name = name;
    new_company.id = companies.length -1;
    new_company.wallet_address = msg.sender;
    new_company.current_employees = new uint256[](0);
    new_user.previous_employees = new uint256[](0);
    address_to_id[msg.sender] = new_company.id;
    is_company[msg.sender] - true
    }