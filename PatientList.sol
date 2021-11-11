//SPDX-License-Identifier: None

pragma solidity ^0.8.0;

import "./Patient.sol";

contract PatientList
{
    Patient [] public patientList;
    uint64 patientsCreatedCount;
    uint64 patientsEnteredCount;
    mapping (uint64 => uint64) UIDtoArrayIndex;
    function createPatient() public
    {
        Patient patient = new Patient();
        patientList.push(patient);
        ++patientsCreatedCount;
    }
    function enterPatientData(uint64 _uid, string memory _first_name, string memory _last_name, string memory _blood_group, uint16 _age, uint56 _contact_details, uint8 _dob, uint8 _mob, uint16 _yob) public
    {
        Patient patient = Patient(address(patientList[patientsEnteredCount]));
        patient.addPatientData( _uid, _first_name, _last_name, _blood_group, _age, _contact_details, _dob, _mob, _yob);
        UIDtoArrayIndex[_uid]=patientsEnteredCount++;
    }
    function fetchPatientData(uint64 _uid) public view returns (string memory, string memory, string memory, uint16, uint56, uint8, uint8, uint16)
    {
        Patient patient = Patient(address(patientList[UIDtoArrayIndex[_uid]]));
        return patient.retrievePatientData(_uid);
    }
}