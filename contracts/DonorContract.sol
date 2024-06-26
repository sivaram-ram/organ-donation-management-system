// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract DonorContract {

    struct pledged
    {
        string fullname;
        uint age;
        string gender;
        string medical_id;
        string blood_type;
        string[] organ;
        uint weight;
        uint height;
    }

    struct donor
    {
        string fullname;
        uint age;
        string gender;
        string medical_id;
        string blood_type;
        string[] organ;
        uint weight;
        uint height;
    }

    struct patient
    {
        string fullname;
        uint age;
        string gender;
        string medical_id;
        string blood_type;
        string[] organ;
        uint weight;
        uint height;
        string inpatient;
    }
    
    mapping ( string =>donor ) donorMap;
    mapping ( string =>patient) patientMap;

    
    string[] DonorsArray;
    string[] PatientsArray;
    
    
    function setDonors(string memory _fullname, uint _age, string memory _gender, string memory _medical_id,
                       string memory _blood_type, string[] memory _organ, uint _weight, uint _height)
    public
    {
        require ( keccak256(abi.encodePacked((donorMap[_medical_id].medical_id))) != keccak256(abi.encodePacked(_medical_id)));
        donorMap[_medical_id].fullname = _fullname;
        donorMap[_medical_id].age = _age;
        donorMap[_medical_id].gender = _gender;
        donorMap[_medical_id].medical_id = _medical_id;
        donorMap[_medical_id].blood_type = _blood_type;
        donorMap[_medical_id].organ = _organ;
        donorMap[_medical_id].weight = _weight;
        donorMap[_medical_id].height = _height;

        DonorsArray.push(_medical_id);
    }

     function setPatients(string memory _fullname, uint _age, string memory _gender, string memory _medical_id,
                       string memory _blood_type, string[] memory _organ, uint _weight, uint _height,string memory _inpatient)
    public
    {
        require ( keccak256(abi.encodePacked((donorMap[_medical_id].medical_id))) != keccak256(abi.encodePacked(_medical_id)));
        patientMap[_medical_id].fullname = _fullname;
        patientMap[_medical_id].age = _age;
        patientMap[_medical_id].gender = _gender;
        patientMap[_medical_id].medical_id = _medical_id;
        patientMap[_medical_id].blood_type = _blood_type;
        patientMap[_medical_id].organ = _organ;
        patientMap[_medical_id].weight = _weight;
        patientMap[_medical_id].height = _height;
        patientMap[_medical_id].inpatient=_inpatient;

        PatientsArray.push(_medical_id);
    }

    

    function getDonor(string memory _medical_id) view public returns(string memory, uint, string memory, string memory, string[] memory, uint, uint)
    {
        return
        (
            donorMap[_medical_id].fullname,
            donorMap[_medical_id].age,
            donorMap[_medical_id].gender,
            donorMap[_medical_id].blood_type,
            donorMap[_medical_id].organ,
            donorMap[_medical_id].weight,
            donorMap[_medical_id].height
        );
    }

     function getPatient(string memory _medical_id) view public returns(patient memory)
    {
    return patientMap[_medical_id];
    }

    

    function validateDonor(string memory _medical_id) view public returns(bool)
    {

     if (keccak256(abi.encodePacked((donorMap[_medical_id].medical_id))) == keccak256(abi.encodePacked(_medical_id)))
        return true;
     else return false;

    }

    function validatePatient(string memory _medical_id) view public returns(bool)
    {

     if (keccak256(abi.encodePacked((patientMap[_medical_id].medical_id))) == keccak256(abi.encodePacked(_medical_id)))
        return true;
     else return false;

    }

    function getAllDonorIDs() view public returns(string[] memory)
    {
        return DonorsArray;
    }

    function getAllPatientIDs() view public returns(string[] memory)
    {
        return PatientsArray;
    }

   

    function getCountOfDonors() view public returns (uint)
    {
        return DonorsArray.length;
    }

    function getCountOfPatients() view public returns (uint)
    {
        return PatientsArray.length;
    }

}
