//SPDX-License-Identifier: None

pragma solidity ^0.8.0;

contract Patient
{
    uint16 public age;
    uint8 public date_of_birth;
    uint8 public month_of_birth;
    uint16 public year_of_birth;
    uint64 public uniqueID;
    string public first_name;
    string public last_name;
    string public blood_group;
    uint56 public contact_details;
    
    mapping (uint64 => string) public UIDtoFirstName;
    mapping (uint64 => string) public UIDtoLastName;
    mapping (uint64 => string) public UIDtoBloodGroup;
    mapping (uint64 => uint16) public UIDtoAge;
    mapping (uint64 => uint56) public UIDtoContactDetails;
    mapping (uint64 => uint8) public UIDtoDOB;
    mapping (uint64 => uint8) public UIDtoMOB;
    mapping (uint64 => uint16) public UIDtoYOB;
    
    function addPatientData(uint64 _uid, string memory _first_name, string memory _last_name, string memory _blood_group, uint16 _age, uint56 _contact_details, uint8 _dob, uint8 _mob, uint16 _yob) external
    {
        uniqueID = _uid;
        first_name = _first_name;
        last_name = _last_name;
        blood_group = _blood_group;
        age = _age;
        date_of_birth = _dob;
        month_of_birth = _mob;
        year_of_birth = _yob;
        contact_details = _contact_details;
        
        
        UIDtoFirstName[uniqueID] = first_name;
        UIDtoLastName[uniqueID] = last_name;
        UIDtoBloodGroup[uniqueID] = blood_group;
        UIDtoAge[uniqueID] = age;
        UIDtoContactDetails[uniqueID] = contact_details;
        UIDtoDOB[uniqueID] = date_of_birth;
        UIDtoMOB[uniqueID] = month_of_birth;
        UIDtoYOB[uniqueID] = year_of_birth;
    }
    function retrievePatientData(uint64 _uid) external view returns(string memory, string memory, string memory, uint16, uint56, uint8, uint8, uint16)
    {
        uint64 tmpuniqueID = _uid;
        return (UIDtoFirstName[tmpuniqueID],UIDtoLastName[tmpuniqueID],UIDtoBloodGroup[tmpuniqueID],UIDtoAge[tmpuniqueID],UIDtoContactDetails[tmpuniqueID],UIDtoDOB[tmpuniqueID],UIDtoMOB[tmpuniqueID],UIDtoYOB[tmpuniqueID]);
    }
}