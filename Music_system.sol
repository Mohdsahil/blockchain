// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract MusicStorage {
    struct Music {
        string name;
        string artist;
        string album;
        string genre;
        string fileHash;
    }

    Music[] public musics;

    function add_music(string memory _name, string memory _artist, string memory _album, string memory _genre, string memory _fileHash) public {
        musics.push(Music(_name, _artist, _album, _genre, _fileHash));
    }

    function get_music(uint index) public view returns(string memory, string memory, string memory, string memory, string memory) {
        require(index < musics.length, "Invalid index");
        return (musics[index].name, musics[index].artist, musics[index].album, musics[index].genre, musics[index].fileHash);
    }
}

contract MusicSale {
    struct User {
        string[] purchased;
    }

     struct Music {
        string name;
        string artist;
        string album;
        string genre;
        string fileHash;
    }

    Music[] public musics;

    mapping(address => User) users;
    mapping(string => uint) musicPrices;

    function setMusicPrice(string memory _fileHash, uint _price) public {
        musicPrices[_fileHash] = _price;
    }

   function buyMusic (string memory _fileHash) public payable {
        require(musicPrices[_fileHash] > 0, "Music file does not exist");
        require(msg.value == musicPrices[_fileHash], "Insufficient fund");
        address payable seller = payable(owner());
        seller.transfer(msg.value);
        users[msg.sender].purchased.push(_fileHash);
   }

    function get_music(uint index) public view returns(string memory, string memory, string memory, string memory, string memory) {
        require(index < musics.length, "Invalid index");
        return (musics[index].name, musics[index].artist, musics[index].album, musics[index].genre, musics[index].fileHash);
    }

   function owner() public view returns(address) {
       return address(this);
   }
}